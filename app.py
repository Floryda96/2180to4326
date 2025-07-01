import sys
import geopandas as gpd
import os
import shutil
import requests


def fetch_dem_data(south, north, west, east, api_key="182cf1a7e1c9ff57784ab4496e34e31e", demtype="COP30", output_format="GTiff"):
    url = "https://portal.opentopography.org/API/globaldem"

    params = {
        "demtype": demtype,
        "south": south,
        "north": north,
        "west": west,
        "east": east,
        "outputFormat": output_format,
        "API_Key": api_key
    }

    headers = {
        "accept": "*/*"
    }

    response = requests.get(url, params=params, headers=headers)

    if response.status_code == 200:
        filename = "DEM.tif"
        with open(filename, "wb") as f:
            f.write(response.content)
        print(f"DEM data saved to {filename}")
    else:
        print(f"Failed to fetch DEM data: {response.status_code}")
        print(response.text)


def bbox_z_pliku(input_dir):
    try:
        gdf = gpd.read_file(input_dir)
        x_coords = []
        y_coords = []
        for geom in gdf.geometry:
            if geom.geom_type == 'Point':
                x_coords.append(geom.x)
                y_coords.append(geom.y)
            elif geom.geom_type == 'MultiPoint':
                for point in geom.geoms:
                    x_coords.append(point.x)
                    y_coords.append(point.y)
        if not x_coords:
            raise ValueError("Nie znaleziono punktów w pliku")
        west = min(x_coords) - 30
        east = max(x_coords) + 30
        south = min(y_coords) - 30
        north = max(y_coords) + 30
        return west, east, south, north
    except Exception as e:
        raise Exception(f"Błąd odczytu pliku: {e}")

def resource_path(relative_path):
    # Gdy uruchomione z .exe, zasoby są wypakowane do sys._MEIPASS
    try:
        base_path = sys._MEIPASS
    except AttributeError:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)
def copy_styles_to_output(output_folder):
    source_folder = resource_path("Styles")
    destination_folder = os.path.join(output_folder, "Styles")
    if not os.path.exists(destination_folder):
        shutil.copytree(source_folder, destination_folder)
        print(f"Skopiowano folder 'styles' do: {destination_folder}")
    else:
        print(f"Folder 'styles' już istnieje w: {destination_folder}")
# Lista plików wejściowych (bez ścieżki, zakładamy że są w tym samym folderze co skrypt)
shapefiles = [
    "ciek_lin.shp", "kom_lin.shp", "komp_lin.shp", "les_pol.shp",
    "od_pkt.shp", "oddz_lin.shp", "oddz_pol.shp", "pnsw_pol.shp",
    "ppoz_pkt.shp", "syt_pol.shp", "wydz_pol.shp"
]
# Katalog wejściowy i wyjściowy
input_dir = "./"
output_dir = "./"

os.makedirs(output_dir, exist_ok=True)
for shp_file in shapefiles:
    shp_path = os.path.join(input_dir, shp_file)
    if not os.path.exists(shp_path):
        print(f"Plik nie istnieje: {shp_path}")
        continue
    try:
        # Wczytaj plik .shp
        gdf = gpd.read_file(shp_path)
        # Ustaw lub potwierdź CRS jeśli nie ustawiony
        if gdf.crs is None:
            gdf.set_crs(epsg=2180, inplace=True)
        # Przekształć do WGS 84
        gdf = gdf.to_crs(epsg=4326)
        # Zapisz jako GeoJSON
        output_filename = os.path.splitext(shp_file)[0] + ".geojson"
        output_path = os.path.join(output_dir, output_filename)
        gdf.to_file(output_path, driver="GeoJSON")
        print(f":white_check_mark: Przekonwertowano: {shp_file} → {output_filename}")
    except Exception as e:
        print(f":x: Błąd przy pliku {shp_file}: {e}")
copy_styles_to_output(output_dir)
west, east, south, north= bbox_z_pliku(input_dir)
fetch_dem_data(south, north, west, east)
if getattr(sys, 'frozen', False):
    input("Naciśnij Enter, aby zakończyć...")

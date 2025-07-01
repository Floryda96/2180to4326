import sys
import geopandas as gpd
import os
import shutil
import requests

# Configuration constants
MARGIN_DEGREES = 0.27
SOURCE_CRS = 2180  # EPSG:2180 (PUWG 2000)
TARGET_CRS = 4326  # WGS84
DEM_FILENAME = "DEM.tif"
API_TIMEOUT = 30


def fetch_dem_data(south, north, west, east, api_key="182cf1a7e1c9ff57784ab4496e34e31e",
                   demtype="COP30", output_format="GTiff"):
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

    try:
        response = requests.get(url, params=params, timeout=API_TIMEOUT)
        response.raise_for_status()

        with open(DEM_FILENAME, "wb") as f:
            f.write(response.content)
        print(f"DEM data saved to {DEM_FILENAME}")
        return True

    except requests.RequestException as e:
        print(f"Failed to fetch DEM data: {e}")
        return False


def bbox_z_pliku(input_dir):
    try:
        gdf = gpd.read_file(input_dir)

        # Use GeoPandas built-in bounds method
        bounds = gdf.total_bounds  # [minx, miny, maxx, maxy]

        west = bounds[0] - MARGIN_DEGREES
        south = bounds[1] - MARGIN_DEGREES
        east = bounds[2] + MARGIN_DEGREES
        north = bounds[3] + MARGIN_DEGREES

        return west, east, south, north
    except Exception as e:
        raise Exception(f"Błąd odczytu pliku: {e}")


def resource_path(relative_path):
    # When running from .exe, resources are unpacked to sys._MEIPASS
    try:
        base_path = sys._MEIPASS
    except AttributeError:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)


def copy_styles_to_output(output_folder):
    source_folder = resource_path("Styles")
    destination_folder = os.path.join(output_folder, "Styles")

    if not os.path.exists(destination_folder):
        try:
            shutil.copytree(source_folder, destination_folder)
            print(f"Skopiowano folder 'Styles' do: {destination_folder}")
        except Exception as e:
            print(f"Błąd kopiowania foldera Styles: {e}")
    else:
        print(f"Folder 'Styles' już istnieje w: {destination_folder}")


def main():
    # Input files list
    shapefiles = [
        "ciek_lin.shp", "kom_lin.shp", "komp_lin.shp", "les_pol.shp",
        "od_pkt.shp", "oddz_lin.shp", "oddz_pol.shp", "pnsw_pol.shp",
        "ppoz_pkt.shp", "syt_pol.shp", "wydz_pol.shp"
    ]

    # Input and output directories
    input_dir = "./"
    output_dir = "./"

    os.makedirs(output_dir, exist_ok=True)

    # Process shapefiles
    successful_conversions = []
    for shp_file in shapefiles:
        shp_path = os.path.join(input_dir, shp_file)
        output_filename = os.path.splitext(shp_file)[0] + ".geojson"
        output_path = os.path.join(output_dir, output_filename)

        # Check if file is already converted
        if os.path.exists(output_path):
            print(f"⚠ Plik już istnieje, pomijam: {output_filename}")
            successful_conversions.append(output_filename)
            continue

        if not os.path.exists(shp_path):
            print(f"Plik nie istnieje: {shp_path}")
            continue

        try:
            gdf = gpd.read_file(shp_path)

            # Set CRS if missing
            if gdf.crs is None:
                gdf.set_crs(epsg=SOURCE_CRS, inplace=True)
            elif gdf.crs.to_epsg() != SOURCE_CRS:
                print(f"Ostrzeżenie: {shp_file} ma CRS {gdf.crs}, oczekiwano EPSG:{SOURCE_CRS}")

            # Transform to WGS 84
            gdf = gdf.to_crs(epsg=TARGET_CRS)

            # Save as GeoJSON
            gdf.to_file(output_path, driver="GeoJSON")

            successful_conversions.append(output_filename)
            print(f"✓ Przekonwertowano: {shp_file} → {output_filename}")

        except Exception as e:
            print(f"✗ Błąd przy pliku {shp_file}: {e}")

    print(f"\nPomyślnie przekonwertowano {len(successful_conversions)} plików")

    # Copy styles folder
    copy_styles_to_output(output_dir)

    # Download DEM data
    if 'ppoz_pkt.geojson' in successful_conversions:
        try:
            west, east, south, north = bbox_z_pliku('ppoz_pkt.geojson')
            print(f"Pobieranie danych DEM dla obszaru: W:{west:.4f}, E:{east:.4f}, S:{south:.4f}, N:{north:.4f}")
            fetch_dem_data(south, north, west, east)
        except Exception as e:
            print(f"Błąd podczas pobierania danych DEM: {e}")
    else:
        print("Ostrzeżenie: Nie można pobrać danych DEM - brak pliku ppoz_pkt.geojson")


if __name__ == "__main__":
    main()

    # Wait for user input when running as executable
    if getattr(sys, 'frozen', False):
        input("Naciśnij Enter, aby zakończyć...")

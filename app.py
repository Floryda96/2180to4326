import sys
import geopandas as gpd
import os
import shutil
import requests
import math

# Configuration constants
SOURCE_CRS = 2180  # EPSG:2180 (PUWG 2000) - Polish coordinate system
TARGET_CRS = 4326  # WGS84 - Global coordinate system
DEM_FILENAME = "DEM.tif"
API_TIMEOUT = 30


def fetch_dem_data(south, north, west, east, api_key="182cf1a7e1c9ff57784ab4496e34e31e",
                   demtype="COP30", output_format="GTiff"):
    """Download DEM data from OpenTopography API"""

    # Check if DEM file already exists
    if os.path.exists(DEM_FILENAME):
        print(f"DEM file already exists, skipping: {DEM_FILENAME}")
        return True

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
        # Make API request with timeout
        response = requests.get(url, params=params, timeout=API_TIMEOUT)
        response.raise_for_status()

        # Save DEM data to file
        with open(DEM_FILENAME, "wb") as f:
            f.write(response.content)
        print(f"DEM data saved to {DEM_FILENAME}")
        return True

    except requests.RequestException as e:
        print(f"Failed to fetch DEM data: {e}")
        return False


def calculate_margin_degrees(latitude, radius_km):
    """Calculate margin in degrees for given radius in km at specific latitude"""
    # Latitude: 1 degree = ~111.11 km everywhere
    lat_margin = radius_km / 111.11

    # Longitude: varies with latitude due to Earth's curvature
    lon_margin = radius_km / (111.11 * math.cos(math.radians(latitude)))

    return lat_margin, lon_margin


def bbox_z_pliku(input_dir, radius_km=30):
    """Calculate bounding box with margin for given radius from GeoJSON file"""
    try:
        # Read GeoJSON file
        gdf = gpd.read_file(input_dir)
        bounds = gdf.total_bounds  # [minx, miny, maxx, maxy]

        # Calculate center latitude for margin calculation
        center_lat = (bounds[1] + bounds[3]) / 2

        # Calculate appropriate margins based on latitude
        lat_margin, lon_margin = calculate_margin_degrees(center_lat, radius_km)

        # Apply margins to bounds
        west = bounds[0] - lon_margin
        south = bounds[1] - lat_margin
        east = bounds[2] + lon_margin
        north = bounds[3] + lat_margin

        print(f"Margines: {lat_margin:.4f}° (lat), {lon_margin:.4f}° (lon) dla promienia {radius_km}km")

        return west, east, south, north
    except Exception as e:
        raise Exception(f"Błąd odczytu pliku: {e}")


def resource_path(relative_path):
    """Get absolute path to resource, works for dev and for PyInstaller"""
    if getattr(sys, 'frozen', False) and hasattr(sys, '_MEIPASS'):
        base_path = sys._MEIPASS  # pylint: disable=no-member
    else:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)


def copy_styles_to_output(output_folder):
    """Copy Styles folder to output directory"""
    source_folder = resource_path("Styles")
    destination_folder = os.path.join(output_folder, "Styles")

    # Skip if Styles folder already exists
    if os.path.exists(destination_folder):
        print(f"Folder 'Styles' już istnieje, pomijam: {destination_folder}")
        return

    # Check if source folder exists
    if not os.path.exists(source_folder):
        print(f"Folder źródłowy 'Styles' nie istnieje: {source_folder}")
        return

    try:
        shutil.copytree(source_folder, destination_folder)
        print(f"Skopiowano folder 'Styles' do: {destination_folder}")
    except Exception as e:
        print(f"Błąd kopiowania foldera Styles: {e}")


def main():
    """Main processing function"""
    # List of input shapefiles to convert
    shapefiles = [
        "ciek_lin.shp", "kom_lin.shp", "komp_lin.shp", "les_pol.shp",
        "od_pkt.shp", "oddz_lin.shp", "oddz_pol.shp", "pnsw_pol.shp",
        "ppoz_pkt.shp", "syt_pol.shp", "wydz_pol.shp"
    ]

    # Input and output directories
    input_dir = "./"
    output_dir = "./"

    os.makedirs(output_dir, exist_ok=True)

    # Process each shapefile
    successful_conversions = []
    for shp_file in shapefiles:
        shp_path = os.path.join(input_dir, shp_file)
        output_filename = os.path.splitext(shp_file)[0] + ".geojson"
        output_path = os.path.join(output_dir, output_filename)

        # Skip if already converted
        if os.path.exists(output_path):
            print(f"Plik już istnieje, pomijam: {output_filename}")
            successful_conversions.append(output_filename)
            continue

        # Skip if source file doesn't exist
        if not os.path.exists(shp_path):
            print(f"Plik nie istnieje: {shp_path}")
            continue

        try:
            # Read shapefile
            gdf = gpd.read_file(shp_path)

            # Set CRS if missing (assume Polish PUWG 2000)
            if gdf.crs is None:
                gdf.set_crs(epsg=SOURCE_CRS, inplace=True)
            elif gdf.crs.to_epsg() != SOURCE_CRS:
                print(f"Ostrzeżenie: {shp_file} ma CRS {gdf.crs}, oczekiwano EPSG:{SOURCE_CRS}")

            # Transform to WGS84 for web compatibility
            gdf = gdf.to_crs(epsg=TARGET_CRS)

            # Save as GeoJSON
            gdf.to_file(output_path, driver="GeoJSON")

            successful_conversions.append(output_filename)
            print(f"Przekonwertowano: {shp_file} → {output_filename}")

        except Exception as e:
            print(f"Błąd przy pliku {shp_file}: {e}")

    print(f"\nPomyślnie przekonwertowano {len(successful_conversions)} plików")

    # Copy styles folder for visualization
    copy_styles_to_output(output_dir)

    # Download DEM data based on points extent
    if 'ppoz_pkt.geojson' in successful_conversions:
        try:
            # Calculate bounding box with 30km buffer
            west, east, south, north = bbox_z_pliku('ppoz_pkt.geojson', radius_km=30)
            print(f"Pobieranie danych DEM dla obszaru: W:{west:.4f}, E:{east:.4f}, S:{south:.4f}, N:{north:.4f}")
            fetch_dem_data(south, north, west, east)
        except Exception as e:
            print(f"Błąd podczas pobierania danych DEM: {e}")
    else:
        print("Nie można pobrać danych DEM - brak pliku ppoz_pkt.geojson")


if __name__ == "__main__":
    main()

    # Wait for user input when running as executable
    if getattr(sys, 'frozen', False):
        input("Naciśnij Enter, aby zakończyć...")

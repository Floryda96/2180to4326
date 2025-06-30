import os
import geopandas as gpd
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
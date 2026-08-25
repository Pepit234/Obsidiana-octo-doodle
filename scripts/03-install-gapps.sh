#!/bin/bash
set -e

echo "== Descargando OpenGApps para redroid =="
mkdir -p ./data/gapps
cd ./data/gapps

# NOTA: reemplaza esta URL por la última release compatible
# con tu versión de Android (revisa https://github.com/MindTheGapps/13.0.0-arm64)
wget -O gapps.zip "URL_DE_MINDTHEGAPPS_AQUI"
unzip gapps.zip

echo "== Copiando GApps al contenedor =="
docker cp ./data/gapps/. cloud-phone:/system/

echo "== Reiniciando contenedor =="
docker restart cloud-phone

echo "Listo. Abre la Play Store desde la vista noVNC para iniciar sesión."

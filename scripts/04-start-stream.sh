#!/bin/bash
set -e

echo "== Levantando servicios =="
docker compose up -d

echo "== Estado de contenedores =="
docker compose ps

IP=$(curl -s ifconfig.me)
echo ""
echo "Accede desde tu celular en:"
echo "  http://$IP:8080  (vista del celular)"
echo "  ADB: adb connect $IP:5555"

#!/bin/bash
set -e

echo "== Actualizando sistema =="
apt update && apt upgrade -y

echo "== Instalando dependencias base =="
apt install -y curl wget git unzip nano ufw

echo "== Configurando firewall =="
ufw allow 22/tcp
ufw allow 5555/tcp
ufw allow 8080/tcp
ufw --force enable

echo "== Verificando soporte binder (necesario para redroid) =="
if [ -e /dev/binder ]; then
  echo "binder OK"
else
  echo "ADVERTENCIA: no se detecta /dev/binder, puede que necesites un kernel con soporte binder_linux"
fi

echo "Listo. Sigue con 02-install-docker.sh"

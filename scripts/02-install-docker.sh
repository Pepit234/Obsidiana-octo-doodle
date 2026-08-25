#!/bin/bash
set -e

echo "== Instalando Docker =="
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "== Instalando docker-compose plugin =="
apt install -y docker-compose-plugin

echo "== Habilitando Docker al inicio =="
systemctl enable docker
systemctl start docker

echo "Docker instalado. Verifica con: docker --version"

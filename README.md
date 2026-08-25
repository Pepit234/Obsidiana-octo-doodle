# Obsidiana-octo-doodle — Celular en la nube

Android corriendo 24/7 en un VPS, accesible desde cualquier navegador o cliente VNC/ADB.

## Requisitos
- VPS con KVM/virtualización anidada habilitada (Hetzner, Contabo, OVH, Vast.ai)
- Ideal: GPU dedicada para 120fps (revisa `docs/SETUP.md`)
- Ubuntu 22.04

## Instalación rápida
\`\`\`bash
git clone https://github.com/Pepit234/Obsidiana-octo-doodle.git
cd Obsidiana-octo-doodle
chmod +x scripts/*.sh
./scripts/01-setup-vps.sh
./scripts/02-install-docker.sh
docker compose up -d
./scripts/03-install-gapps.sh
./scripts/04-start-stream.sh
\`\`\`

## Acceso
Abre `http://TU_IP:8080` desde el navegador del celular.

Ver `docs/SETUP.md` para guía detallada paso a paso.

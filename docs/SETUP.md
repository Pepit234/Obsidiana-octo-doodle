# Guía de instalación paso a paso

## Paso 1: Consigue un VPS
Necesitas uno que permita **virtualización anidada / KVM**. Opciones:
- Hetzner Cloud (CX plans, sin GPU) — barato para probar sin 120fps
- Vast.ai / RunPod — con GPU, por hora, ideal para el objetivo de 120fps
- Contabo VPS — barato, revisa que tenga binder habilitado

## Paso 2: Conéctate desde Termux
\`\`\`bash
pkg install openssh git -y
ssh root@TU_IP_DEL_VPS
\`\`\`

## Paso 3: Clona el repo en el VPS
\`\`\`bash
git clone https://github.com/Pepit234/Obsidiana-octo-doodle.git
cd Obsidiana-octo-doodle
\`\`\`

## Paso 4: Ejecuta los scripts en orden
\`\`\`bash
chmod +x scripts/*.sh
./scripts/01-setup-vps.sh
./scripts/02-install-docker.sh
docker compose up -d
./scripts/03-install-gapps.sh
./scripts/04-start-stream.sh
\`\`\`

## Paso 5: Accede desde tu celular
Abre el navegador (Chrome, Brave, el que sea) y entra a:
\`\`\`
http://TU_IP:8080
\`\`\`
Ahí verás la pantalla del Android corriendo en la nube.

## Paso 6: Inicia sesión en Play Store
Desde esa vista, toca la Play Store, inicia sesión con una cuenta de Google
(recomendado: una cuenta nueva, no la principal, por si detectan el emulador).

## Paso 7: Deja el celular AFK
Como todo corre en el contenedor Docker del VPS con `restart: unless-stopped`,
seguirá corriendo aunque cierres el navegador o apagues tu celular.
\`\`\`
docker compose ps   # para verificar que sigue vivo
\`\`\`

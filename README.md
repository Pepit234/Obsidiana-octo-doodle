# BaseScout — Meteor Client Addon

Addon de exploración para Meteor Client / Fabric. Detecta construcciones visibles en los chunks que el cliente ya ha cargado y crea marcadores locales.

## Alcance
- Escaneo periódico de chunks cargados.
- Detección heurística de actividad/construcciones mediante bloques visibles.
- Marcadores locales con coordenadas.
- Lista de descubrimientos y filtro de distancia.
- Sin exploits, bypasses, lectura de chunks no enviados por el servidor ni automatización de combate.

## Objetivo
Minecraft Java 1.21.8 + Java 21.

> Nota: el API exacto de Meteor/Fabric puede cambiar entre snapshots. El proyecto sigue la estructura oficial de Meteor Addon Template y puede requerir ajustar la versión de Meteor en `gradle/libs.versions.toml` antes de compilar.

## Compilación
1. Instala Java 21.
2. Coloca el proyecto en un entorno Gradle.
3. Ejecuta `./gradlew build`.
4. El JAR aparecerá en `build/libs/`.

Coloca el JAR junto a Meteor Client en la carpeta `mods`.

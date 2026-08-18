# Bot de Minecraft Bedrock (básico)

Bot de prueba para servidores Minecraft **Bedrock**, hecho con [bedrock-protocol](https://github.com/PrismarineJS/bedrock-protocol).

## ⚠️ Antes de usarlo

- Solo úsalo en servidores donde tengas **permiso del administrador**, o en tu propio servidor/entorno de pruebas.
- Muchos servidores prohíben bots y banean automáticamente si los detectan.
- Este código es solo para fines educativos y de prueba.

## Requisitos

- [Node.js](https://nodejs.org/) instalado (versión 18 o superior recomendada).

## Instalación

1. Descomprime esta carpeta.
2. Abre una terminal dentro de la carpeta `minecraft-bot`.
3. Instala las dependencias:

```bash
npm install
```

## Configuración

Edita el archivo `config.json`:

```json
{
  "host": "IP_DEL_SERVIDOR",
  "port": 19132,
  "username": "MiBot",
  "offline": true,
  "mensajeBienvenida": "¡Hola! Soy un bot de prueba."
}
```

- `host`: la IP o dominio del servidor Bedrock.
- `port`: normalmente `19132` en servidores Bedrock.
- `username`: el nombre que tendrá el bot dentro del juego.
- `offline`: `true` para conexión sin cuenta de Xbox (solo funciona si el servidor lo permite).

## Ejecutar el bot

```bash
npm start
```

Si todo funciona bien, verás en la consola:

```
Conectando al servidor...
✅ Bot conectado y spawneado en el mundo
```

## Qué hace este bot

- Se conecta al servidor como un jugador normal.
- Manda un mensaje de bienvenida al chat al conectarse.
- Muestra en consola los mensajes del chat del servidor.

## Próximos pasos (para experimentar)

- Añadir movimiento automático.
- Responder a comandos del chat.
- Guardar coordenadas o estadísticas.

La documentación completa de la librería está en:
https://github.com/PrismarineJS/bedrock-protocol

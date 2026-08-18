const bedrock = require('bedrock-protocol')
const path = require('path')
const config = require(path.join(__dirname, '..', 'config.json'))

// ==============================
//  BOT BÁSICO PARA MINECRAFT BEDROCK
//  Usa la librería bedrock-protocol
// ==============================

console.log('Conectando al servidor...')
console.log(`Host: ${config.host} | Puerto: ${config.port} | Usuario: ${config.username}`)

const client = bedrock.createClient({
  host: config.host,
  port: config.port,
  username: config.username,
  offline: config.offline // true = sin cuenta de Xbox (solo funciona en servidores que lo permitan)
})

// Cuando el bot termina de conectarse y aparece en el mundo
client.on('spawn', () => {
  console.log('✅ Bot conectado y spawneado en el mundo')

  // Manda un mensaje de bienvenida al chat
  enviarMensaje(config.mensajeBienvenida)
})

// Escucha mensajes del chat del servidor
client.on('text', (packet) => {
  if (packet.message) {
    console.log(`[CHAT] ${packet.source_name || 'Servidor'}: ${packet.message}`)
  }
})

// Manejo de errores de conexión
client.on('error', (err) => {
  console.error('❌ Error de conexión:', err.message)
})

// Cuando se cierra la conexión
client.on('close', () => {
  console.log('🔌 Conexión cerrada')
})

// Función para enviar mensajes al chat del servidor
function enviarMensaje(mensaje) {
  client.queue('text', {
    type: 'chat',
    needs_translation: false,
    source_name: config.username,
    message: mensaje,
    parameters: [],
    xuid: '',
    platform_chat_id: '',
    filtered_message: ''
  })
}

// Ejemplo: mover al bot (descomenta para probar)
// setInterval(() => {
//   client.queue('player_auth_input', {
//     ...
//   })
// }, 1000)

module.exports = client

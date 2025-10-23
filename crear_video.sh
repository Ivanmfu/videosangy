#!/bin/bash

# Script para crear nueva página de video
# Uso: ./crear_video.sh "Nombre del Video" "numero_video" "https://tudominio.com"

if [ $# -lt 2 ]; then
    echo "Uso: $0 \"Título del Video\" \"numero_video\" [URL_BASE]"
    echo "Ejemplo: $0 \"Mi Video Vertical\" \"video11\" \"https://misitio.com\""
    exit 1
fi

TITULO="$1"
NUMERO="$2"
URL_BASE="${3:-https://tudominio.com}"

# Crear directorio para el video
mkdir -p "$NUMERO"

# URL completa del video
URL_COMPLETA="$URL_BASE/$NUMERO/"

# Crear archivo index.html personalizado
cat > "$NUMERO/index.html" << EOF
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$TITULO - Galería de Videos</title>
  
  <!-- Meta tags para compartir en redes sociales -->
  <meta name="description" content="Mira este video: $TITULO">
  <meta property="og:title" content="$TITULO">
  <meta property="og:description" content="Mira este video en nuestra galería">
  <meta property="og:type" content="video.other">
  <meta property="og:url" content="$URL_COMPLETA">
  <meta property="og:video" content="$URL_COMPLETA/video.mp4">
  <meta property="og:video:type" content="video/mp4">
  <meta property="og:site_name" content="Galería de Videos">
  
  <!-- Meta tags para Twitter -->
  <meta name="twitter:card" content="player">
  <meta name="twitter:title" content="$TITULO">
  <meta name="twitter:description" content="Mira este video en nuestra galería">
  <meta name="twitter:player" content="$URL_COMPLETA">
  
  <style>
    body { 
      background:#000; 
      margin:0; 
      color:#fff; 
      font-family:system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, Helvetica, Arial, sans-serif; 
      min-height:100vh;
      display:flex;
      flex-direction:column;
    }
    
    .header {
      padding:20px;
      background:#111;
      border-bottom:1px solid #333;
    }
    
    .nav {
      display:flex;
      justify-content:space-between;
      align-items:center;
      max-width:1200px;
      margin:0 auto;
      width:100%;
    }
    
    .title {
      font-size:24px;
      margin:0;
      color:#00ffc8;
      font-weight:600;
    }
    
    .back-link {
      color:#00ffc8;
      text-decoration:none;
      font-weight:500;
      padding:8px 16px;
      border:1px solid #00ffc8;
      border-radius:6px;
      transition:all 0.2s ease;
    }
    
    .back-link:hover {
      background:#00ffc8;
      color:#000;
    }
    
    .video-container {
      flex:1;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:20px;
    }
    
    .video-wrapper {
      width:100%;
      max-width:600px; /* Ancho máximo para videos verticales */
      max-height:80vh;
    }
    
    video {
      width:100%;
      height:auto;
      max-height:80vh;
      border-radius:12px;
      outline:none;
      box-shadow:0 8px 32px rgba(0,255,200,0.1);
    }
    
    .video-placeholder {
      background:#222;
      border-radius:12px;
      padding:40px;
      text-align:center;
      aspect-ratio:9/16;
      display:flex;
      flex-direction:column;
      justify-content:center;
      align-items:center;
      border:2px dashed #333;
    }
    
    .placeholder-icon {
      width:60px;
      height:60px;
      border-radius:50%;
      background:#00ffc8;
      display:flex;
      align-items:center;
      justify-content:center;
      margin-bottom:20px;
      font-size:24px;
    }
    
    .video-info {
      margin-top:16px;
      text-align:center;
      color:#bbb;
      font-size:14px;
    }
    
    .share-section {
      background:#111;
      padding:20px;
      border-top:1px solid #333;
    }
    
    .share-content {
      max-width:1200px;
      margin:0 auto;
      text-align:center;
    }
    
    .share-title {
      color:#00ffc8;
      margin:0 0 12px 0;
      font-size:16px;
    }
    
    .share-url {
      background:#222;
      border:1px solid #333;
      border-radius:6px;
      padding:12px;
      color:#fff;
      font-family:monospace;
      font-size:14px;
      width:100%;
      max-width:500px;
      margin:0 auto;
      cursor:pointer;
      transition:border-color 0.2s ease;
    }
    
    .share-url:hover,
    .share-url:focus {
      border-color:#00ffc8;
      outline:none;
    }
    
    .copy-message {
      margin-top:8px;
      color:#00ffc8;
      font-size:12px;
      opacity:0;
      transition:opacity 0.3s ease;
    }
    
    .copy-message.show {
      opacity:1;
    }
    
    /* Responsivo para móviles */
    @media (max-width: 768px) {
      .nav {
        flex-direction:column;
        gap:12px;
        text-align:center;
      }
      
      .title {
        font-size:20px;
      }
      
      .video-wrapper {
        max-width:100%;
      }
      
      video {
        max-height:70vh;
      }
      
      .header {
        padding:16px;
      }
      
      .video-container {
        padding:16px;
      }
    }
    
    /* Para pantallas muy pequeñas (modo vertical del móvil) */
    @media (max-width: 480px) and (orientation: portrait) {
      video {
        max-height:60vh;
      }
      
      .video-container {
        padding:12px;
      }
    }
  </style>
</head>
<body>
  <div class="header">
    <div class="nav">
      <h1 class="title">$TITULO</h1>
      <a href="../" class="back-link">← Galería</a>
    </div>
  </div>
  
  <div class="video-container">
    <div class="video-wrapper">
      <video controls autoplay playsinline preload="auto" id="mainVideo">
        <source src="video.mp4" type="video/mp4">
        <source src="$NUMERO.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de video.
      </video>
      
      <!-- Placeholder que se muestra si no hay video -->
      <div class="video-placeholder" id="placeholder" style="display:none;">
        <div class="placeholder-icon">📹</div>
        <h3 style="color:#00ffc8; margin:0 0 10px 0;">Video pendiente</h3>
        <p style="color:#bbb; margin:0; font-size:14px;">Sube tu archivo como <strong>video.mp4</strong> o <strong>$NUMERO.mp4</strong></p>
      </div>
      
      <div class="video-info">
        <p>📱 Optimizado para videos verticales • 🔗 Comparte este enlace directo</p>
      </div>
    </div>
  </div>
  
  <div class="share-section">
    <div class="share-content">
      <h3 class="share-title">Compartir este video</h3>
      <input type="text" class="share-url" value="$URL_COMPLETA" readonly onclick="copyToClipboard(this)">
      <div class="copy-message" id="copyMessage">¡Enlace copiado al portapapeles!</div>
    </div>
  </div>
  
  <script>
    function copyToClipboard(element) {
      element.select();
      element.setSelectionRange(0, 99999); // Para móviles
      
      try {
        document.execCommand('copy');
        const message = document.getElementById('copyMessage');
        message.classList.add('show');
        setTimeout(() => {
          message.classList.remove('show');
        }, 2000);
      } catch (err) {
        console.error('Error al copiar: ', err);
      }
    }
    
    // Función moderna para copiar (si está disponible)
    if (navigator.clipboard) {
      function copyToClipboard(element) {
        navigator.clipboard.writeText(element.value).then(() => {
          const message = document.getElementById('copyMessage');
          message.classList.add('show');
          setTimeout(() => {
            message.classList.remove('show');
          }, 2000);
        });
      }
    }
    
    // Función para forzar reproducción automática
    function forceAutoplay() {
      const video = document.getElementById('mainVideo');
      if (video) {
        // Intentar reproducir el video
        const playPromise = video.play();
        
        if (playPromise !== undefined) {
          playPromise.then(() => {
            console.log('Reproducción automática exitosa');
          }).catch(error => {
            console.log('Reproducción automática bloqueada por el navegador:', error);
            // Mostrar un botón de play manual si es necesario
            showPlayButton();
          });
        }
      }
    }
    
    // Mostrar botón de play manual si la reproducción automática falla
    function showPlayButton() {
      const video = document.getElementById('mainVideo');
      if (video.paused) {
        // Crear overlay con botón de play
        const overlay = document.createElement('div');
        overlay.id = 'playOverlay';
        overlay.style.cssText = \`
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(0,0,0,0.7);
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
          border-radius: 12px;
          z-index: 10;
        \`;
        
        overlay.innerHTML = \`
          <div style="text-align: center; color: white;">
            <div style="width: 80px; height: 80px; border-radius: 50%; background: #00ffc8; display: flex; align-items: center; justify-content: center; margin: 0 auto 10px;">
              <span style="font-size: 30px; margin-left: 5px;">▶️</span>
            </div>
            <p style="margin: 0; font-size: 16px;">Toca para reproducir</p>
          </div>
        \`;
        
        // Agregar overlay al contenedor del video
        const videoWrapper = video.parentElement;
        videoWrapper.style.position = 'relative';
        videoWrapper.appendChild(overlay);
        
        // Evento para reproducir al hacer clic
        overlay.addEventListener('click', () => {
          video.play();
          overlay.remove();
        });
        
        // Remover overlay cuando el video comience a reproducirse
        video.addEventListener('play', () => {
          if (overlay.parentElement) {
            overlay.remove();
          }
        });
      }
    }
    
    // Detectar si el video se puede cargar
    document.addEventListener('DOMContentLoaded', function() {
      const video = document.getElementById('mainVideo');
      const placeholder = document.getElementById('placeholder');
      
      if (video) {
        // Configurar eventos del video
        video.addEventListener('loadeddata', function() {
          video.style.display = 'block';
          if (placeholder) placeholder.style.display = 'none';
          console.log('Video cargado, intentando reproducción automática');
          // Pequeño delay para asegurar que todo esté listo
          setTimeout(forceAutoplay, 500);
        });
        
        video.addEventListener('error', function() {
          video.style.display = 'none';
          if (placeholder) placeholder.style.display = 'flex';
          console.log('Error cargando el video');
        });
        
        // Intentar reproducción inmediata si el video ya está cargado
        if (video.readyState >= 3) {
          setTimeout(forceAutoplay, 100);
        }
      }
    });
    
    // Intentar reproducción cuando el usuario interactúa con la página
    document.addEventListener('click', function() {
      const video = document.getElementById('mainVideo');
      if (video && video.paused) {
        forceAutoplay();
      }
    }, { once: true });
    
    // Para dispositivos móviles - intentar cuando se toca la pantalla
    document.addEventListener('touchstart', function() {
      const video = document.getElementById('mainVideo');
      if (video && video.paused) {
        forceAutoplay();
      }
    }, { once: true });
  </script>
</body>
</html>
EOF

echo "✅ Página creada para '$TITULO' en el directorio '$NUMERO'"
echo "📁 Coloca tu archivo de video como '$NUMERO/video.mp4'"
echo "🌐 URL del video: $URL_COMPLETA"
echo ""
echo "Para agregar este video a la galería principal, añade esta línea al index.html:"
echo "<a class=\"card\" href=\"$NUMERO/\"><div class=\"title\">$TITULO</div><div class=\"hint\">Abrir $TITULO</div></a>"
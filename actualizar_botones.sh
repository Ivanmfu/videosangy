#!/bin/bash

# Script para actualizar todos los videos con la nueva sección de botones (Compartir + Check)

echo "🔄 Actualizando todos los videos con nueva sección de botones..."

# Array de números de video a actualizar (excluyendo video1 que ya está actualizado)
videos=(2 3 4 5 6 7 8 9 10)

for num in "${videos[@]}"; do
    echo "📹 Actualizando video$num con nuevos botones..."
    
    # Leer el archivo actual y hacer los reemplazos necesarios
    
    # 1. Actualizar los estilos CSS
    sed -i '' '/\.copy-message\.show {/,/opacity:1;/{
        /opacity:1;/a\
    }\
\
    /* Estilos para los nuevos botones */\
    .button-container {\
      display: flex;\
      gap: 15px;\
      justify-content: center;\
      align-items: center;\
      flex-wrap: wrap;\
    }\
\
    .share-button,\
    .check-button {\
      background: #00ffc8;\
      color: #000;\
      border: none;\
      padding: 12px 24px;\
      border-radius: 25px;\
      font-size: 16px;\
      font-weight: 600;\
      cursor: pointer;\
      transition: all 0.3s ease;\
      text-decoration: none;\
      display: inline-flex;\
      align-items: center;\
      gap: 8px;\
      box-shadow: 0 4px 15px rgba(0,255,200,0.3);\
    }\
\
    .share-button:hover,\
    .check-button:hover {\
      background: #00e6b8;\
      transform: translateY(-2px);\
      box-shadow: 0 6px 20px rgba(0,255,200,0.4);\
    }\
\
    .check-button {\
      background: #ff6b6b;\
      box-shadow: 0 4px 15px rgba(255,107,107,0.3);\
    }\
\
    .check-button:hover {\
      background: #ff5252;\
      box-shadow: 0 6px 20px rgba(255,107,107,0.4);
    }' "video$num/index.html"
    
    # 2. Actualizar la sección HTML de compartir
    sed -i '' 's/<h3 class="share-title">Compartir este video<\/h3>/<h3 class="share-title">Acciones<\/h3>/' "video$num/index.html"
    
    # 3. Reemplazar el input por los botones
    sed -i '' '/<input type="text" class="share-url"/c\
      <div class="button-container">\
        <button class="share-button" onclick="shareVideo()">\
          <span>📤</span>\
          <span>Compartir</span>\
        </button>\
        <a href="https://tools.checkqrpay.com/pruebas-kiosko-limbo/68f9fe303e8058a0b63cb057" class="check-button" target="_blank">\
          <span>✅</span>\
          <span>Check</span>\
        </a>\
      </div>' "video$num/index.html"
    
    # 4. Añadir las funciones JavaScript para compartir
    # Buscar después de la función copyToClipboard existente y añadir las nuevas funciones
    sed -i '' '/if (navigator\.clipboard) {/,/}/{ 
        /}/a\
\
    // Función para compartir el video\
    function shareVideo() {\
      const videoUrl = window.location.href;\
      const videoTitle = "Vídeo '$num'";\
\
      // Verificar si el navegador soporta Web Share API\
      if (navigator.share) {\
        navigator.share({\
          title: videoTitle,\
          text: "Mira este video increíble",\
          url: videoUrl\
        }).then(() => {\
          console.log("Video compartido exitosamente");\
        }).catch(err => {\
          console.log("Error al compartir:", err);\
          fallbackShare(videoUrl);\
        });\
      } else {\
        // Fallback para navegadores que no soportan Web Share API\
        fallbackShare(videoUrl);\
      }\
    }\
\
    // Función fallback para compartir\
    function fallbackShare(url) {\
      // Copiar URL al portapapeles\
      if (navigator.clipboard) {\
        navigator.clipboard.writeText(url).then(() => {\
          showShareMessage("¡Enlace copiado! Compártelo donde quieras");\
        });\
      } else {\
        // Fallback más antiguo\
        const textArea = document.createElement("textarea");\
        textArea.value = url;\
        document.body.appendChild(textArea);\
        textArea.select();\
        try {\
          document.execCommand("copy");\
          showShareMessage("¡Enlace copiado! Compártelo donde quieras");\
        } catch (err) {\
          showShareMessage("Enlace: " + url);\
        }\
        document.body.removeChild(textArea);\
      }\
    }\
\
    // Mostrar mensaje de compartir\
    function showShareMessage(text) {\
      const message = document.getElementById("copyMessage");\
      message.textContent = text;\
      message.classList.add("show");\
      setTimeout(() => {\
        message.classList.remove("show");\
        // Restaurar texto original después de un momento\
        setTimeout(() => {\
          message.textContent = "¡Enlace copiado al portapapeles!";\
        }, 500);\
      }, 3000);\
    }
    }' "video$num/index.html"
    
    echo "✅ Video$num actualizado con nuevos botones"
done

echo ""
echo "🎉 ¡Todos los videos actualizados con la nueva sección de botones!"
echo ""
echo "📋 Cambios implementados:"
echo "   📤 Botón 'Compartir' - Usa Web Share API o copia al portapapeles"
echo "   ✅ Botón 'Check' - Enlaza a https://tools.checkqrpay.com/pruebas-kiosko-limbo/68f9fe303e8058a0b63cb057"
echo "   🎨 Diseño moderno con hover effects"
echo "   📱 Totalmente responsive"
echo ""
echo "🎯 Los usuarios ahora pueden:"
echo "   1. Compartir fácilmente con el botón de compartir"
echo "   2. Acceder al enlace Check con un clic"
echo "   3. Mejor experiencia visual con botones atractivos"
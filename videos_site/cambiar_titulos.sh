#!/bin/bash

# Script para cambiar títulos de videos fácilmente
# Uso: ./cambiar_titulos.sh

echo "🎬 Configurador de Títulos de Videos"
echo "======================================"
echo ""

# Array para almacenar los nuevos títulos
declare -a nuevos_titulos

echo "📝 Introduce los nuevos títulos para cada video:"
echo "   (Presiona Enter sin escribir nada para mantener el título actual)"
echo ""

# Obtener títulos actuales del index.html
titulos_actuales=(
    "Vídeo 1"
    "Vídeo 2" 
    "Vídeo 3"
    "Vídeo 4"
    "Vídeo 5"
    "Vídeo 6"
    "Vídeo 7"
    "Vídeo 8"
    "Vídeo 9"
    "Vídeo 10"
)

for i in {1..10}; do
    echo -n "🎯 Título para Video $i (actual: '${titulos_actuales[$((i-1))]}'): "
    read nuevo_titulo
    
    if [ -z "$nuevo_titulo" ]; then
        nuevos_titulos[$((i-1))]="${titulos_actuales[$((i-1))]}"
        echo "   ✓ Manteniendo: '${titulos_actuales[$((i-1))]}'"
    else
        nuevos_titulos[$((i-1))]="$nuevo_titulo"
        echo "   ✓ Nuevo título: '$nuevo_titulo'"
    fi
    echo ""
done

echo ""
echo "📋 Resumen de cambios:"
echo "======================"
for i in {1..10}; do
    if [ "${nuevos_titulos[$((i-1))]}" != "${titulos_actuales[$((i-1))]}" ]; then
        echo "📹 Video $i: '${titulos_actuales[$((i-1))]}' → '${nuevos_titulos[$((i-1))]}'"
    fi
done

echo ""
echo -n "¿Aplicar estos cambios? (s/N): "
read confirmar

if [[ $confirmar =~ ^[Ss]$ ]]; then
    echo ""
    echo "🔄 Aplicando cambios..."
    
    # Hacer backup del archivo original
    cp index.html index.html.backup
    echo "💾 Backup creado: index.html.backup"
    
    # Aplicar cambios al index.html
    temp_file=$(mktemp)
    cp index.html "$temp_file"
    
    for i in {1..10}; do
        if [ "${nuevos_titulos[$((i-1))]}" != "${titulos_actuales[$((i-1))]}" ]; then
            echo "   📝 Actualizando Video $i..."
            
            # Reemplazar en la galería (card-overlay)
            sed -i.bak "s|<div class=\"title\">${titulos_actuales[$((i-1))]}</div>|<div class=\"title\">${nuevos_titulos[$((i-1))]}</div>|g" "$temp_file"
            
            # Reemplazar en el placeholder
            sed -i.bak "s|<div class=\"placeholder-title\">${titulos_actuales[$((i-1))]}</div>|<div class=\"placeholder-title\">${nuevos_titulos[$((i-1))]}</div>|g" "$temp_file"
            
            rm -f "$temp_file.bak"
        fi
    done
    
    # Aplicar cambios finales
    mv "$temp_file" index.html
    
    echo ""
    echo "🎉 ¡Títulos actualizados exitosamente!"
    echo ""
    echo "📁 Archivos modificados:"
    echo "   ✅ index.html (galería principal)"
    echo "   💾 index.html.backup (respaldo)"
    echo ""
    echo "🔄 Ahora actualizando las páginas individuales..."
    
    # Actualizar páginas individuales
    for i in {1..10}; do
        if [ "${nuevos_titulos[$((i-1))]}" != "${titulos_actuales[$((i-1))]}" ]; then
            echo "   📹 Actualizando página individual del Video $i..."
            
            # Actualizar el archivo individual del video
            video_file="video$i/index.html"
            if [ -f "$video_file" ]; then
                # Hacer backup
                cp "$video_file" "$video_file.backup"
                
                # Actualizar título en la página individual
                sed -i.bak "s|<title>.*</title>|<title>${nuevos_titulos[$((i-1))]} - Galería de Videos</title>|g" "$video_file"
                sed -i.bak "s|<h1 class=\"title\">.*</h1>|<h1 class=\"title\">${nuevos_titulos[$((i-1))]}</h1>|g" "$video_file"
                sed -i.bak "s|<meta property=\"og:title\" content=\".*\">|<meta property=\"og:title\" content=\"${nuevos_titulos[$((i-1))]}\">|g" "$video_file"
                sed -i.bak "s|<meta name=\"twitter:title\" content=\".*\">|<meta name=\"twitter:title\" content=\"${nuevos_titulos[$((i-1))]}\">|g" "$video_file"
                
                rm -f "$video_file.bak"
                echo "   ✅ $video_file actualizado"
            fi
        fi
    done
    
    echo ""
    echo "🎊 ¡TODOS LOS TÍTULOS ACTUALIZADOS!"
    echo ""
    echo "🌐 Para ver los cambios:"
    echo "   1. Abre index.html en tu navegador"
    echo "   2. Los nuevos títulos aparecerán en la galería"
    echo "   3. Las páginas individuales también están actualizadas"
    echo ""
    echo "↩️ Para deshacer cambios:"
    echo "   mv index.html.backup index.html"
    
else
    echo ""
    echo "❌ Cambios cancelados. No se modificó nada."
fi

echo ""
echo "✨ ¡Gracias por usar el configurador de títulos!"
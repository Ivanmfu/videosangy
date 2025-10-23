#!/bin/bash

# Script para actualizar todas las URLs de tudominio.com a GitHub Pages

echo "🔗 Actualizando URLs para GitHub Pages..."
echo "=========================================="

# URL base del sitio en GitHub Pages
GITHUB_URL="https://ivanmfu.github.io/videosangy"

# Lista de videos con sus títulos actuales
declare -A video_titles=(
    ["1"]="Victor"
    ["2"]="Lucho"
    ["3"]="Pello"
    ["4"]="Irene"
    ["5"]="Vídeo 5"
    ["6"]="Vídeo 6"
    ["7"]="Vídeo 7"
    ["8"]="Vídeo 8"
    ["9"]="Vídeo 9"
    ["10"]="Vídeo 10"
)

for num in {1..10}; do
    video_file="video$num/index.html"
    title="${video_titles[$num]}"
    
    if [ -f "$video_file" ]; then
        echo "📹 Actualizando $video_file (Título: $title)..."
        
        # Crear backup
        cp "$video_file" "$video_file.github_backup"
        
        # Actualizar todas las URLs de tudominio.com
        sed -i.bak "s|https://tudominio.com/video$num/|$GITHUB_URL/video$num/|g" "$video_file"
        sed -i.bak "s|https://tudominio.com/video$num/video.mp4|$GITHUB_URL/video$num/video$num.mp4|g" "$video_file"
        
        # Actualizar meta description para que coincida con el título
        sed -i.bak "s|<meta name=\"description\" content=\"Mira este video: Vídeo $num\">|<meta name=\"description\" content=\"Mira este video: $title\">|g" "$video_file"
        
        # Limpiar archivos temporales
        rm -f "$video_file.bak"
        
        echo "   ✅ URLs actualizadas para $title"
    else
        echo "   ⚠️  Archivo $video_file no encontrado"
    fi
done

echo ""
echo "🎉 ¡Actualización de URLs completada!"
echo ""
echo "📋 Cambios realizados:"
echo "   🔗 tudominio.com → ivanmfu.github.io/videosangy"
echo "   📱 Meta tags actualizados para redes sociales"
echo "   🎬 URLs de videos corregidas"
echo "   💾 Backups creados con extensión .github_backup"
echo ""
echo "🚀 Siguiente paso: git add . && git commit && git push"
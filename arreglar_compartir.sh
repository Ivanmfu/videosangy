#!/bin/bash

# Script para arreglar el texto de compartir en todos los videos

echo "🔧 Arreglando función de compartir en todos los videos..."
echo "======================================================"

for num in {1..10}; do
    video_file="video$num/index.html"
    
    if [ -f "$video_file" ]; then
        echo "📹 Corrigiendo función de compartir en $video_file..."
        
        # Crear backup
        cp "$video_file" "$video_file.share_backup"
        
        # Eliminar el texto problemático "Mira este video increíble"
        # y usar solo el título del video
        sed -i.bak 's/text: "Mira este video increíble",//g' "$video_file"
        
        # Limpiar archivos temporales
        rm -f "$video_file.bak"
        
        echo "   ✅ Función de compartir corregida"
    else
        echo "   ⚠️  Archivo $video_file no encontrado"
    fi
done

echo ""
echo "🎉 ¡Corrección de función compartir completada!"
echo ""
echo "📋 Cambios realizados:"
echo "   🗑️  Eliminado texto 'Mira este video increíble' problemático"
echo "   🔗 Web Share API ahora solo comparte título y URL"
echo "   📱 Enlaces compartidos funcionarán correctamente"
echo "   💾 Backups creados con extensión .share_backup"
echo ""
echo "🚀 Siguiente paso: git add . && git commit && git push"
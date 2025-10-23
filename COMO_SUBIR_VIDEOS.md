# 🎥 Guía Rápida: Cómo Subir Videos

## ✅ Solución al problema "no se ve el video"

El video no se muestra porque necesitas colocar archivos de video reales en las carpetas. Aquí te explico cómo hacerlo:

## 📁 Estructura actual detectada:

```
video1/
├── index.html ✅
└── video1.mp4 ✅ (archivo detectado)
```

Para video1, el problema está resuelto. Para los demás videos:

## 🔧 Pasos para subir videos:

### Opción 1: Usar nombres estándar (recomendado)
```bash
# Para cada carpeta de video, copia tu archivo como "video.mp4"
cp tu_video_vertical.mp4 video2/video.mp4
cp otro_video.mp4 video3/video.mp4
# etc...
```

### Opción 2: Usar nombres específicos
```bash
# Si prefieres mantener nombres específicos
cp tu_video.mp4 video2/video2.mp4
cp otro_video.mp4 video3/video3.mp4
```

## 📱 Formatos de video recomendados:

### ✅ Formatos que funcionan:
- **MP4** (H.264) - ⭐ RECOMENDADO
- **WebM** (VP9)
- **MOV** (convertir a MP4)

### 📐 Resoluciones ideales para vertical:
- **1080x1920** (Full HD vertical)
- **720x1280** (HD vertical)
- **1080x1350** (4:5 Instagram)

### 💾 Tamaño recomendado:
- **Máximo**: 50MB por video
- **Óptimo**: 10-25MB por video

## 🛠️ Herramientas para convertir videos:

### Línea de comandos (FFmpeg):
```bash
# Convertir cualquier video a formato vertical optimizado
ffmpeg -i input.mov -vf "scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -crf 23 -preset medium output.mp4

# Comprimir video existente
ffmpeg -i input.mp4 -c:v libx264 -crf 28 -preset medium compressed.mp4
```

### Apps móviles gratuitas:
- **InShot** (iOS/Android)
- **CapCut** (iOS/Android) 
- **Adobe Premiere Rush** (iOS/Android)

### Apps de escritorio:
- **HandBrake** (gratuito)
- **VLC Media Player** (conversión básica)

## 🚀 Crear nuevo video (usando script):

```bash
# Navegar al directorio
cd videos_site

# Crear nueva página de video
./crear_video.sh "Mi Video TikTok" "video11" "https://misitio.com"

# Subir el video
cp mi_video_vertical.mp4 video11/video.mp4
```

## ✨ Verificar que funciona:

1. **Abrir la página** en el navegador
2. **Debería mostrar** el reproductor de video
3. **Si no funciona**, verifica:
   - ✅ El archivo existe y tiene el nombre correcto
   - ✅ El formato es MP4
   - ✅ El tamaño no es excesivo (< 50MB)
   - ✅ No hay espacios en el nombre del archivo

## 📞 Troubleshooting común:

### ❌ "Video no se carga"
- Verifica que el archivo sea MP4
- Comprueba que el nombre coincida (video.mp4 o videoN.mp4)
- Reduce el tamaño si es muy grande

### ❌ "Video se ve cortado"
- Tu video probablemente es horizontal
- Conviértelo a formato vertical (9:16)

### ❌ "Video va muy lento"
- El archivo es muy pesado
- Comprímelo con las herramientas mencionadas

### ❌ "No se puede reproducir"
- Formato no compatible
- Convierte a MP4 con H.264

## 🎯 Próximos pasos:

1. **Sube videos a las carpetas existentes** (video2, video3, etc.)
2. **Actualiza los títulos** en el archivo principal `index.html`
3. **Prueba los enlaces directos** de cada video
4. **Configura tu dominio** real en lugar de "tudominio.com"

---

💡 **Tip**: Para mejores resultados, graba directamente en vertical con tu móvil en lugar de rotar videos horizontales.
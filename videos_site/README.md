# 📱 Galería de Videos Verticales

Una galería web optimizada para videos verticales con enlaces directos para compartir.

## ✨ Características principales

- **🎥 Optimizada para videos verticales**: Diseño especial para contenido en formato 9:16
- **📱 Totalmente responsive**: Se adapta perfectamente a móviles y tablets
- **🔗 Enlaces directos**: Cada video tiene su propia URL para compartir fácilmente
- **📤 Metadatos sociales**: Configurados para compartir en redes sociales
- **⚡ Carga rápida**: Diseño optimizado y sin dependencias externas
- **🎨 Diseño moderno**: Interfaz limpia y atractiva

## 🚀 Cómo subir un nuevo video

### Método 1: Usando el script automatizado

```bash
# Navegar al directorio de tu sitio
cd videos_site

# Crear nueva página de video
./crear_video.sh "Mi Video Increíble" "video11" "https://tudominio.com"

# Copiar tu archivo de video
cp tu_video.mp4 video11/video.mp4
```

### Método 2: Manual

1. **Crear directorio**: Crea una carpeta con el nombre del video (ej: `video11/`)
2. **Copiar plantilla**: Usa `video_template.html` como base para `video11/index.html`
3. **Personalizar**: Reemplaza los marcadores `[TITULO_VIDEO]` y `[URL_COMPLETA]`
4. **Subir video**: Coloca tu archivo MP4 como `video11/video.mp4`
5. **Actualizar galería**: Añade el enlace al `index.html` principal

## 📁 Estructura de archivos

```
videos_site/
├── index.html              # Página principal de la galería
├── video_template.html     # Plantilla para nuevos videos
├── crear_video.sh          # Script de automatización
├── video1/
│   ├── index.html          # Página del video 1
│   └── video.mp4           # Archivo de video 1
├── video2/
│   ├── index.html
│   └── video.mp4
└── ...
```

## 🎯 Formatos de video recomendados

### Para videos verticales:
- **Resolución**: 1080x1920 (9:16) o 720x1280
- **Formato**: MP4 (H.264)
- **Tamaño máximo**: 50MB para mejor rendimiento web
- **Duración**: Idealmente menos de 2 minutos

### Herramientas de conversión:
- **FFmpeg**: `ffmpeg -i input.mov -vf "scale=1080:1920" -c:v libx264 -crf 23 output.mp4`
- **Aplicaciones móviles**: InShot, CapCut, Adobe Premiere Rush

## 🌐 Configuración para deployment

### 1. Actualizar URLs
Antes de subir a tu servidor, reemplaza `https://tudominio.com` con tu dominio real en:
- Todas las páginas de video (`video1/index.html`, etc.)
- El script `crear_video.sh`

### 2. Optimización para SEO
```html
<!-- Añadir a cada página de video -->
<meta property="og:image" content="https://tudominio.com/thumbnail.jpg">
<meta property="og:video:width" content="1080">
<meta property="og:video:height" content="1920">
```

### 3. Configuración de servidor

#### Para Netlify:
Crea `_redirects` en la raíz:
```
/video1 /video1/index.html 200
/video2 /video2/index.html 200
# etc...
```

#### Para Apache (.htaccess):
```apache
RewriteEngine On
RewriteRule ^video([0-9]+)/?$ video$1/index.html [L]
```

## 📤 Compartir videos

Cada video tiene su propia URL que puedes compartir directamente:
- `https://tudominio.com/video1/` - Para el video 1
- `https://tudominio.com/video2/` - Para el video 2
- etc.

Los enlaces incluyen:
- ✅ Reproducción automática al abrir
- ✅ Metadatos para redes sociales
- ✅ Botón de copia rápida del enlace
- ✅ Navegación de vuelta a la galería

## 🎨 Personalización

### Cambiar colores:
Edita la variable CSS `--accent` en cualquier archivo:
```css
:root { --accent: #ff6b6b; } /* Rojo */
:root { --accent: #4ecdc4; } /* Verde agua */
:root { --accent: #45b7d1; } /* Azul */
```

### Modificar layout:
- **Grid de galería**: Ajusta `grid-template-columns` en `index.html`
- **Tamaño máximo de video**: Cambia `max-width` en `.video-wrapper`
- **Proporción de cards**: Modifica `aspect-ratio` en `.card`

## 📱 Características responsive

- **Móviles (< 768px)**: Grid de 2-3 columnas, controles táctiles optimizados
- **Tablets (768px - 1024px)**: Grid de 3-4 columnas
- **Desktop (> 1024px)**: Grid de 4-5 columnas con hover effects

## 🔧 Troubleshooting

### Video no se reproduce:
1. Verifica que el archivo sea MP4 con codec H.264
2. Confirma que el archivo se llame exactamente `video.mp4`
3. Comprueba los permisos del archivo en el servidor

### Enlace no funciona:
1. Verifica que el directorio tenga un `index.html`
2. Confirma que la URL esté bien configurada
3. Revisa la configuración del servidor web

### Problemas de carga:
1. Comprime el video si es muy grande
2. Considera usar `preload="none"` en lugar de `preload="metadata"`
3. Implementa lazy loading para múltiples videos

## 📈 Próximas mejoras sugeridas

- [ ] Sistema de upload automático
- [ ] Thumbnails automáticos
- [ ] Estadísticas de reproducción
- [ ] Comentarios y likes
- [ ] Organización por categorías
- [ ] Búsqueda de videos

---

**💡 Tip**: Para mejores resultados, graba tus videos directamente en vertical con tu móvil en lugar de rotar videos horizontales.
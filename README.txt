# Plantilla para vídeos con enlaces separados

## Estructura
- `index.html`: página principal con enlaces a cada vídeo.
- `video1` ... `video10`: carpetas, cada una con su propio `index.html`.

## Cómo usar
1. Coloca **un archivo MP4** dentro de cada carpeta (`video1`, `video2`, etc.).
2. Nómbralo **video.mp4** (o edita el `index.html` dentro de esa carpeta para usar otro nombre).
3. Sube la carpeta `videos_site` a servicios como **Netlify Drop** o **GitHub Pages**.
4. Obtendrás URLs como:
   - Página principal: `https://tusitio.netlify.app/`
   - Vídeo 1: `https://tusitio.netlify.app/video1/`
   - Vídeo 2: `https://tusitio.netlify.app/video2/`
   - ...

## Personalización de nombres
- Cambia los textos "Vídeo 1", "Vídeo 2", etc., editando el `index.html` principal para los enlaces
  y los `index.html` dentro de cada subcarpeta para los títulos de página.

## Notas
- Los archivos MP4 se reproducen directamente sin iniciar sesión.
- Si vas a servir archivos muy pesados y con mucho tráfico, considera un CDN o servicios de vídeo dedicados.

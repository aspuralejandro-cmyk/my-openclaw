# Usamos una imagen de Node completa
FROM node:22-bullseye

# Crear carpeta de trabajo
WORKDIR /app

# Instalar dependencias del sistema por si acaso
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

# Truco de Backend: Instalamos localmente y forzamos el inicio
RUN npm install @openclaw/gateway

# Exponemos el puerto de OpenClaw
EXPOSE 18789

# Comando para iniciar desde la ruta local de node_modules
CMD ["./node_modules/.bin/openclaw", "start", "--foreground"]

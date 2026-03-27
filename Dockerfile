# Usamos una imagen con herramientas de compilación
FROM node:22-bullseye

# Instalamos dependencias del sistema necesarias para compilar módulos de Node
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Instalamos OpenClaw de forma global
RUN npm install -g @openclaw/gateway --unsafe-perm

# Exponemos el puerto
EXPOSE 18789

# Comando para iniciar
CMD ["openclaw", "start", "--foreground"]

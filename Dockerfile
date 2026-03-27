# Usamos Node.js estable
FROM node:22-bullseye

# Carpeta de trabajo
WORKDIR /app

# Instalamos git y herramientas de compilación
RUN apt-get update && apt-get install -y git python3 make g++ && rm -rf /var/lib/apt/lists/*

# Instalamos pnpm globalmente (Esto es lo que faltaba)
RUN npm install -g pnpm

# Clonamos el código oficial de OpenClaw
RUN git clone https://github.com/OpenClaw/OpenClaw.git .

# Instalamos las dependencias usando pnpm
RUN pnpm install

# Construimos el proyecto
RUN pnpm build

# Exponemos el puerto oficial
EXPOSE 18789

# Comando para iniciar (según los scripts de OpenClaw)
CMD ["pnpm", "start"]

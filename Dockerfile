# Usamos Node.js estable
FROM node:22-bullseye

# Carpeta de trabajo
WORKDIR /app

# Instalamos git y herramientas de compilación
RUN apt-get update && apt-get install -y git python3 make g++ && rm -rf /var/lib/apt/lists/*

# Clonamos el código oficial de OpenClaw
RUN git clone https://github.com/OpenClaw/OpenClaw.git .

# Instalamos las dependencias del proyecto
RUN npm install

# Construimos el proyecto (si es necesario)
RUN npm run build --if-present

# Exponemos el puerto oficial
EXPOSE 18789

# Comando para iniciar el gateway
CMD ["npm", "start"]

FROM node:22-slim
RUN npm install -g @openclaw/gateway
EXPOSE 18789
CMD ["openclaw", "start", "--foreground"]
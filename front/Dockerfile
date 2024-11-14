# Use uma imagem base do Node.js
FROM node:16

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o package.json e package-lock.json para instalar as dependências
COPY package*.json ./
RUN npm install

# Copie todo o código do projeto para o container
COPY . .

# Exponha a porta em que o Vite roda (geralmente 5173, mas verifique o vite.config.js)
EXPOSE 5173

# Comando para iniciar o servidor de desenvolvimento do Vite
CMD ["npm", "run", "dev", "--", "--host"]

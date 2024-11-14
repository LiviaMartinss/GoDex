# Use uma imagem base do Node.js para build
FROM node:16 AS build

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o package.json e package-lock.json para instalar as dependências
COPY package*.json ./
RUN npm install

# Copie todo o código do projeto e faça o build
COPY . .
RUN npm run build

# Use uma imagem NGINX para servir os arquivos estáticos em produção
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Exponha a porta 80 para produção
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

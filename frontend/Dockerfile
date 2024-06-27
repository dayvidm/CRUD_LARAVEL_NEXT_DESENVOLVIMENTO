# Estágio de Construção
FROM node:18-alpine AS builder

# Diretório de trabalho
WORKDIR /usr/src/app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar código de aplicação
COPY . .

# Build da aplicação
RUN npm run build

# Estágio de Produção
FROM node:18-alpine

# Diretório de trabalho
WORKDIR /usr/src/app

# Copiar arquivos de construção do estágio anterior
COPY --from=builder /usr/src/app .

# Expor porta e comando padrão
EXPOSE 3000
CMD ["npm", "start"]

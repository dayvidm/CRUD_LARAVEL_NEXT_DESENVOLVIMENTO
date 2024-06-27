# Use uma imagem base do PHP com FPM
FROM php:8.1-fpm

# Instalação de dependências do sistema e do servidor web Nginx
RUN apt-get update && apt-get install -y \
    nginx \
    supervisor \
    # Outras dependências necessárias
# Diretório de trabalho dentro do contêiner
WORKDIR /var/www

# Instalação do Composer e outras dependências do PHP
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_mysql mysqli zip

# Configurações adicionais do Nginx
COPY ./docker/nginx.conf /etc/nginx/sites-available/default

# Copiar arquivos do Laravel para o contêiner
COPY . .

# Expor porta para o servidor web Nginx
EXPOSE 80

# Comando para iniciar o servidor web e o PHP-FPM
CMD service nginx start && php-fpm

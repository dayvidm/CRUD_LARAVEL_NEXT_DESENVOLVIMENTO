# Use a imagem oficial do PHP como base
FROM php:8.3-fpm

# Copie arquivos de configuração do PHP
COPY php.ini /usr/local/etc/php/
COPY docker.conf /usr/local/etc/php-fpm.d/docker.conf
COPY .bashrc /root/

# Diretório de trabalho
WORKDIR /var/www

# Instale as dependências necessárias para o Laravel
RUN apt-get update \
    && apt-get install -y \
        git \
        curl \
        unzip \
        libzip-dev \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libpq-dev \
        zlib1g-dev \
        libicu-dev \
    && docker-php-ext-install \
        pdo_mysql \
        pdo_pgsql \
        gd \
        zip \
        intl

# Copie o código-fonte do Laravel para o contêiner
COPY . /var/www

# Exponha a porta usada pelo PHP-FPM
EXPOSE 9000

# Comando padrão para iniciar o PHP-FPM
CMD ["php-fpm"]

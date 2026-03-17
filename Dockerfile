FROM php:5.6-apache

# PASO 1: Reparamos los repositorios históricos de Debian Stretch
# NOTA: Usamos solo el archivo principal. Las URLs de seguridad se eliminan porque arrojan 404.
RUN rm -rf /etc/apt/sources.list.d/* \
    && echo "deb [trusted=yes] http://archive.debian.org/debian stretch main non-free contrib" > /etc/apt/sources.list \
    && echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until

# PASO 2: Instalamos las librerías del sistema y compilamos las extensiones de Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo pdo_mysql mcrypt gd mbstring

# PASO 3: Habilitamos el módulo de reescritura de URLs de Apache
RUN a2enmod rewrite

# PASO 4: Apuntamos el servidor a la carpeta "public" de tu proyecto
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# PASO 5: Obtenemos Composer 1.x copiándolo directamente de su imagen oficial
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# Directorio de trabajo
WORKDIR /var/www/html

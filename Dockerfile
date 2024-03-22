FROM php:7.4-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libwebp-dev \
    libxml2-dev \
    libicu-dev \
    zlib1g-dev \
    libzip-dev \
    wget \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install zip

# Set recommended PHP.ini settings
# See https://secure.php.net/manual/en/opcache.installation.php
RUN { \
        echo 'opcache.memory_consumption=128'; \
        echo 'opcache.interned_strings_buffer=8'; \
        echo 'opcache.max_accelerated_files=4000'; \
        echo 'opcache.revalidate_freq=2'; \
        echo 'opcache.fast_shutdown=1'; \
        echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the timezone
ENV TZ=America/Sao_Paulo

# Copy Magento files into Apache root
COPY ./local /var/www/html/

# Download Magento 1 files
ENV MAGENTO_VERSION 1.9.4.5
RUN mkdir -p /var/www/html && \
    wget https://github.com/OpenMage/magento-mirror/archive/${MAGENTO_VERSION}.tar.gz -O /tmp/magento.tar.gz && \
    tar -xf /tmp/magento.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/magento.tar.gz

# Expose ports
EXPOSE 80

CMD ["apache2-foreground"]

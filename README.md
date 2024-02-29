# Docker Magento 1

A **very easy** way of using Magento 1 (PHP 5.6 or PHP 7.4) with Docker in Linux!

# Features

- Use PHP `5.6` or `7.4`;
- phpMyAdmin included;
- Magento 1 files linked to local folder (`local/`) making development of modules easier;
- Very simple setup.

# Requirements

- `docker` with `compose` available globally;
- That's it!

# Building it

1. At the repository root, make the install script executable:

```
chmod +x install.sh
```

2. Run the install script

```
sudo ./install.sh
```

3. Browse to `http://127.0.0.1/index.php` and complete your Magento installation through the wizard and you're done! You have a fresh instance of Magento 1 with `PHP 7.4` running in a Docker container :smile:

4. **OPTIONAL:** Install custom assets/translations
```
sudo rsync -a build/custom/ local/
```
This will add:
- 🇧🇷 **pt_BR** translations [by Mario Sam](https://mariosam.com.br/versao1/traducao-magento/);
- [jQuery](https://jquery.com/) globally;
- [Font Awesome](https://fontawesome.com/) globally.

### How to choose between PHP `5.6` or `7.4`?

By default, the container PHP version will be `7.4`. If you would like to change it to `5.6`, browse to the folder `build` and remove the `php-5` from:
- `docker-compose-after-install-php5.yml`
- `docker-compose-build-php5.yml`

This way, this files will be used to setup the Docker container. Now you only need to run `install.sh` and the Docker container will be created with PHP `5.6`!

### The `local` folder

After running the install script, **all Magento files** will be linked to the folder `local` at the root of this repository. Any change made to this folder will affect the Docker container.
This is really useful for development.

### Environment

DB Access:

- `phpmyadmin URL`: http://127.0.0.1:8580
- `username`: root
- `password`: root

Magento Access:
- `admin URL`: http://127.0.0.1/index.php
- `username`: admin
- `password`: admin123


### Translate Pt-BR

Link: https://mariosam.com.br/versao1/traducao-magento/

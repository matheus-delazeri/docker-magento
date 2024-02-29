# Docker Magento 1

1. Make the install script executable

```
chmod +x install.sh
```

2. Run the install script

```
sudo ./install.sh
```

3. Install Magento into the container
* Create the 'magento' database before. You can use the phpmyadmin container for that

```
docker exec -it magento install-magento
```

4. OPTIONAL: Install custom modules/translations
```
sudo rsync -a build/custom/ local/
```

### Configuration

DB Access:

- `phpmyadmin URL`: http://127.0.0.1:8580
- `username`: root
- `password`: root

Magento Access:
- `admin URL`: http://127.0.0.1
- `username`: admin
- `password`: admin123


### Translate Pt-BR

Link: https://mariosam.com.br/versao1/traducao-magento/

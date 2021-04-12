```bash
# Pour mettre à jour sont serveur : 👀
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove --purge -y
```
```bash
# On installe NGINX PHP-FPM 📗
sudo apt install nginx php-fpm php-mysql
```

```bash
# Dans le fichier de conf 
sudo nano /etc/nginx/sites-available/default

# On modifie la partie PHP pour qu'il resemble à ceci

# pass PHP scripts to FastCGI server
        #
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
        #
        #       # With php-fpm (or other unix sockets):
                fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        #       # With php-cgi (or other tcp sockets):
        #       fastcgi_pass 127.0.0.1:9000;
        }
```

```bash
# On redémarre le serveur web
sudo service nginx restart
```
 
````bash
# On installe mariadb-server 📗
# Pour installer le paquet mariadb-server & pwgen
sudo apt install mariadb-server pwgen

# Puis on lance 
sudo mysql_secure_installation
# Répondez Y à toutes les questions suivantes.
````

````bash
# Petit script pour crées un compte user rapidement
# touch CreateUserMariaDB.sh && chmod +x CreateUserMariaDB.sh
# Pour le lancer sudo ./CreateUserMariaDB.sh
#!/bin/bash
PASS=`pwgen -s 70 1`
user=`pwgen 12 1`

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $user character set utf8mb4 collate utf8mb4_unicode_ci;
CREATE USER '$user'@'%' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $user.* TO '$user'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL crées."
echo "Username:   $user"
echo "Password:   $PASS"
````


````bash
# Dans le fichier de conf de MariaDB
# Si on veux rendre le serveur visible depuis l'exterieure
# Modifier comme ceci 
nano /etc/mysql/mariadb.conf.d/50-server.cnf


# on cherche et on modifie la ligne suivante 
# la votre sera surrement en 127.0.0.1
bind-address            = 0.0.0.0
````


## Pour du ssl 🎈
```bash
#On installe le paquet
sudo apt install certbot python3-certbot-nginx

#Puis on génére un certificat
certbot certonly --nginx --agree-tos --no-eff-email --email tonmail@lecul.site -d ndd.lecul.site
```

---
## Exemple de proxy web 💊


```bash
upstream proxyWeb {
    server 0.0.0.0:8888;
}


server {
   listen 80;
    server_name ndd.lecul.site www.ndd.lecul.site;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name ndd.lecul.site;

    ssl_certificate /etc/letsencrypt/live/ndd.lecul.site/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/ndd.lecul.site/privkey.pem;

    access_log /var/log/nginx/access.log combined;
    error_log /var/log/nginx/error.log error;

    location / {
        proxy_pass http://proxyWeb;
    }

}
```

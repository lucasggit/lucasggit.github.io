# Utiliser une image de base contenant Nginx
FROM ubuntu:18.04

# Cloner le référentiel GitHub de votre application web dans le conteneur
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git nginx
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/lucasggit/lucasggit.github.io.git /var/www/html/

# Exposer le port 8080 pour le trafic HTTP
EXPOSE 80

# Démarrer le serveur Nginx lors du lancement du conteneur
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

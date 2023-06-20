# Utiliser une image de base contenant Nginx et OpenSSL
FROM nginx:latest

# Définir le répertoire de travail
WORKDIR /usr/share/nginx/html

# Supprimer le contenu par défaut du répertoire HTML de Nginx
RUN rm -rf ./*

# Cloner le référentiel GitHub de votre application web dans le conteneur
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/votre-utilisateur/votre-repo.git .

# Installer OpenSSL pour générer un certificat auto-signé
RUN apt-get install -y openssl

# Générer un certificat auto-signé
RUN openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -subj "/C=FR/ST=Ile-de-France/L=Paris/O=MyApp/CN=myapp.com" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# Copier le fichier de configuration de Nginx personnalisé
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposer les ports 80 et 443 pour le trafic HTTP et HTTPS
EXPOSE 80
EXPOSE 443

# Démarrer le serveur Nginx lors du lancement du conteneur
CMD ["nginx", "-g", "daemon off;"]

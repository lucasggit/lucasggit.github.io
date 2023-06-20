# Utiliser une image de base contenant Nginx
FROM nginx:latest

# Définir le répertoire de travail
WORKDIR /usr/share/nginx/html

# Supprimer le contenu par défaut du répertoire HTML de Nginx
RUN rm -rf ./*

# Cloner le référentiel GitHub de votre application web dans le conteneur
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/lucasggit/lucasggit.github.io.git .

# Exposer le port 80 pour le trafic HTTP
EXPOSE 8080

# Démarrer le serveur Nginx lors du lancement du conteneur
CMD ["nginx", "-g", "daemon off;"]

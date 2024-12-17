# Étape 1 : Utiliser l'image officielle Node.js
FROM node:18

# Étape 2 : Définir le répertoire de travail
WORKDIR /app

# Étape 3 : Copier les fichiers package.json et package-lock.json depuis le sous-dossier
COPY React_Crudd/package.json React_Crudd/package-lock.json ./

# Étape 4 : Installer les dépendances
RUN npm install

# Étape 5 : Copier tout le contenu de React_Crudd
COPY React_Crudd/. .

# Étape 6 : Construire l'application React
RUN npm run build

# Étape 7 : Servir l'application avec serve
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Exposer le port 3000
EXPOSE 3000

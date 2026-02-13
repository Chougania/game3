FROM python:3.11-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier tout le projet dans le conteneur
COPY . .

# Définir le port (utile si app web)
ENV PORT=8080

# Lancer ton fichier principal (change main.py si nécessaire)
CMD ["python", "main.py"]

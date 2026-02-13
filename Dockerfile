# Exemple simple pour Python
FROM python:3.11-slim

WORKDIR /app


COPY . .

# Railway utilise PORT par défaut
ENV PORT 8080

CMD ["python", "app.py"]

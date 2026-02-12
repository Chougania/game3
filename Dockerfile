# === Build Node.js modules ===
FROM node:alpine AS node-builder

WORKDIR /backend

COPY package*.json . 
RUN npm install

COPY tsconfig.json .
COPY src/*.ts src/
RUN npm run build

# === Nakama server ===
FROM heroiclabs/nakama:3.3.0

# Copier les modules compilés
COPY --from=node-builder /backend/build/*.js /nakama/data/modules/build/

# Copier la config Nakama
COPY local.yml /nakama/data/

# Lancer Nakama en utilisant le port dynamique de Railway
CMD sh -c "nakama \
--name nakama1 \
--database.address postgres:5432 \
--config /nakama/data/local.yml \
--api.address 0.0.0.0 \
--api.port \$PORT \
--socket.address 0.0.0.0 \
--socket.port \$PORT"

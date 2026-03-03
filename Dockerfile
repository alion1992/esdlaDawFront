# ---- Build Angular ----
FROM node:20 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ---- Servir con Nginx ----
FROM nginx:alpine
COPY --from=build /app/dist/AnillosDePoder/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
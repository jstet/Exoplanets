FROM node:16 AS build
WORKDIR /app
COPY package.json ./
RUN npm install 
COPY . ./
RUN npm run build

FROM nginx
COPY --from=build /app/public /usr/share/nginx/html
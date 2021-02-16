
# Stage 1

FROM node:10-alpine as build-step

RUN mkdir -p /app/docs /usr/share/nginx/html


WORKDIR /app



RUN npm install

COPY . /app

RUN npm run build --prod

 

# Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/docs /usr/share/nginx/html
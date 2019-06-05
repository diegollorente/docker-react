FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
#Esto en el portatil no hace nada pero en Beanstalk lo interpreta y lo mapea automático y lo expone para el trafico entrante
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build --> this will produce

FROM nginx
# FOR AWS elasticbenstak to expose the port in production
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
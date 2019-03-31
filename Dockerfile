FROM node:alpine as builder
WORKDIR '/app'
# Install dependencies
COPY ./package.json .
RUN npm install 

COPY . .
RUN npm run build

FROM nginx:1-alpine
COPY --from=builder /app/build /usr/share/nginx/html

FROM node:alpine AS builder
COPY . ./webclient
WORKDIR /webclient
ENV SERVER=52.160.67.118
RUN npm i
RUN $(npm bin)/ng build --prod --build-optimizer=false --aot=false

FROM nginx:alpine
COPY --from=builder /webclient/dist/webclient/ /usr/share/nginx/html/
ARG NODE_IMAGE
FROM ${NODE_IMAGE} as node

RUN gatsby build

FROM amazeeio/nginx
COPY nginx-static-files.conf /etc/nginx/conf.d/app.conf

COPY --from=node /app/public /app

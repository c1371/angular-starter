FROM nginx:alpine

RUN apk update && \
    apk upgrade

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY /angular/dist/angular-starter /usr/share/nginx/html

WORKDIR /app

## add permissions for nginx user
RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

USER nginx
EXPOSE 8080

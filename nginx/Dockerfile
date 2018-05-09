FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 8080

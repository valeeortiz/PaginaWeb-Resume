FROM nginx:alpine

COPY . /usr/share/nginx/html/

# Expone el puerto 80 para el acceso web
EXPOSE 80

# Iniciar NGINX
CMD ["nginx", "-g", "daemon off;"]
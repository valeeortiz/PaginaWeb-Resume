echo "Apagando NGNX y NGROK..."
sudo systemctl stop nginx
pkill -f ngrok

echo "Actualizando la aplicación..."
cd /var/www/html/PaginaWeb-Resume || exit

sudo git pull origin main  
sudo cp -r PaginaWeb-Resume/* /var/www/html

echo "Iniciando NGINX..."
sudo systemctl start nginx

echo "Iniciando NGROK..."
nohup ngrok http 80 > /dev/null 2>&1 &
sleep 5  # Esperar a que NGROK genere la URL

echo "Obteniendo URL pública..."
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

echo "Accede al Resume de Valentina Ortiz: $NGROK_URL"
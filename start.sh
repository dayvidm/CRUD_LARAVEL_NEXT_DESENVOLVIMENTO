#!/bin/bash

echo "Subindo o frontend..."
cd frontend
npm run dev || yarn dev &
cd ..
cd backend

echo "Subindo os serviços do Docker Compose..."
docker-compose up -d

echo "Aguardando os serviços iniciarem..."
sleep 10

echo "Ajustando permissões..."
docker-compose exec application chown -R www-data:www-data /var/www/storage
docker-compose exec application chown -R www-data:www-data /var/www/bootstrap/cache
docker-compose exec application chmod -R 775 /var/www/storage
docker-compose exec application chmod -R 775 /var/www/bootstrap/cache

echo "Tudo pronto!"

@echo off
echo Subindo o frontend...
cd frontend
start cmd /c "npm run dev" || start cmd /c "yarn dev"
cd ..
cd backend

echo Subindo os servicos do Docker Compose...
docker-compose up -d

echo Tudo pronto!
pause

@echo off
echo Subindo o frontend...
cd frontend
start cmd /c "npm run dev" || start cmd /c "yarn dev"
cd ..
cd backend

echo Subindo os servicos do Docker Compose...
docker-compose up -d

cd ..

set CONTAINER_NAME=postgres_container

echo Verificando se o contêiner PostgreSQL já está rodando...
docker ps -a --format "{{.Names}}" | findstr /I /C:"%CONTAINER_NAME%"
if %errorlevel%==0 (
    echo O contêiner %CONTAINER_NAME% já existe. Iniciando o contêiner...
    docker start %CONTAINER_NAME%
) else (
    echo O contêiner %CONTAINER_NAME% não existe. Criando e iniciando o contêiner...
    docker run --name %CONTAINER_NAME% -p 5432:5432 -v /tmp/database:/var/lib/postgresql/data -e POSTGRES_PASSWORD=1234 -d postgres
)

echo Tudo pronto!
pause

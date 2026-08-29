//*Arquivo para orientação como instalar e rodar o projeto*


//Comandos para instalação das imagens e rodar os containers

npm install express = Baixa imagem do Node npm pra API.

npm init -y = cria automaticamente um arquivo package.json padrão na pasta, o -y é pra aceitar todas as perguntas que faria

docker pull mysql:latest = Baixa a ultima imagem do MySQL para Docker.

docker network create rede-docker = cria uma rede Docker personalizada.

docker run --name sql-docker --network rede-docker --cpus="0.2" --memory="128m" --memory-swap="512m" --storage-opt size=1G -e MYSQL_ROOT_PASSWORD=senha123 -e MYSQL_DATABASE=dbdocker -p 3005:3005 -v volume-sql:/var/lib/mysql -v "%cd%\criadb.sql:/docker-entrypoint-initdb.d/criadb.sql" -d mysql:latest
    = sobe o container Mysql com memória, cpus e armazenamento limitado dentro da rede-docker, com senha do banco, nome do banco e cria o volume-sql caso já não exista. memory-swap foi usado para quando o container subir não travar na criação do banco por falta de memória, que utiliza o arquivo criadb.sql

docker build -t atv-docker . = Builda a imagem do programa node na pasta raiz

docker run --name api-docker --network rede-docker --cpus="0.2" --memory="128m" --storage-opt size=1G -p 3000:3000 -d atv-docker
    = cria o container da imagem atv-docker com o node dentro da rede-docker e com os recursos limitados rodando na porta local 3000


//Para testar o funcionamento da aplicação

Para acessar a API abra o navegador no localhost:3000. localhost:3000/produtos retorna um JSON com os produtos cadastrados no banco e localhost:3000/categorias retorna um JSON com as categorias cadastradas no banco 
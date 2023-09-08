# chaskiq-docker-compose
Chaskiq Docker-compose file

# Description
Small docker-compose.yml with .env.example file and docker-entrypoint.sh which can get you started in production

# Installation
 - Create a data folder on the same level as repo files
 - Create subfolders in datafolder: postgres, redis and storage
 - copy .env.example to .env and change environment settings as needed (guide: https://dev.chaskiq.io/production-configuration/enviroment-variables-configuration)

# Run
docker-compose up -d

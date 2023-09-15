# chaskiq-docker-compose
Chaskiq Docker-compose file

# Description
Small docker-compose.yml with .env.example file and docker-entrypoint.sh which can get you started in production

# Installation
 - copy .env.example to .env and change environment settings as needed (guide: https://dev.chaskiq.io/production-configuration/enviroment-variables-configuration)

# Run
- chmod +x docker-entrypoint.sh
- docker-compose up -d

# Post Installation
 - After a first succesful start, edit docker-entrypoint.sh and comment the line "bundle exec rake admin_generator"

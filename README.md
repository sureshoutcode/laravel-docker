# Laravel Docker 

Setup for the laravel to be compose over the docker 

## Run server/setup 

- Run command to build image from Dockerfile <br/>
`
$ docker build -f Dockerfile -t laravel-docker
`

## Run Server 

## local dev 

`
$ docker-compose -f docker-compose.yml up
`
### Stop Server (If run in background)

`
$ docker-compose stop
`

### Delete Docker Images with volume

`
$ docker-compose down --volume
`

### Delete all docker resources (images, containers, volumes, networks)

`
$ docker system prune -a
`

# Command to execute the artisan command
`
docker exec laravel-docker-php-1(docker-container-name) php artisan 
`

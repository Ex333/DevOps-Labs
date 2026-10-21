# Lab 01 - First Docker Container

## Objective

Today I wanted to create my first nginx container using nginx:alpine image.

I wanted to run container in background, give him a name nginx_day_01_lab and map host port 8080 to container port 80.

## Tasks

- Create and run nginx container.
- Run container in background.
- Give container a name.
- Map port 8080 on host to port 80 inside container.
- Check if container is running.
- Check stopped containers.
- Open nginx page in browser.
- Check logs and container configuration.
- Enter inside container.

## Commands

- `docker ps` - check running containers.
- `docker ps -a` - check all containers.
- `docker logs` - check container logs.
- `docker inspect` - check container details.
- `docker exec -it nginx_day_01_lab sh` - enter inside container.
- `docker stop` - stop container.
- `docker start` - start container again.

## What I learned

- How to run nginx container.
- How to run container in background.
- How port mapping works.
- How to check if container is running.
- How to check logs.
- I tried to enter container with bash but it didnt work because nginx alpine dont have bash. I used sh and it worked.
- I can open nginx page in browser using localhost:8080.
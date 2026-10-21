# Docker Notes - Day 1

## Commands

- `docker ps` - show running containers.
- `docker ps -a` - show all containers, also stopped ones.
- `docker logs firstlab_nginx` - check logs.
- `docker exec -it firstlab_nginx sh` - enter inside container.
- `docker stop firstlab_nginx` - stop container.
- `docker start firstlab_nginx` - start container again.

## What I need to remember

- `-d` means run container in background.
- `-p or --publish 8080:80` means host port 8080 and container port 80.
- nginx:alpine dont have bash, so I need to use sh.
- If I want to change port mapping, I need to recreate container.

## Problems

I tried to use bash but it didnt work. I used sh and it worked.

First I mapped port 80:80, but later I recreated container with port 8080:80.
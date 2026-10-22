# Docker Notes - Day 2

## Commands

- `docker build -t my-nginx-page .` - build my own image.
- `docker images` - show all images.
- `docker run -d --name test-nazwa11 -p 8081:80 nazwa11` - create and start container.
- `docker exec -it test-nazwa11 sh` - open shell inside running container.
- `ls -lah /usr/share/nginx/html/` - check files inside container.
- `docker rmi image_name` - remove image.

## Dockerfile

- `FROM` - choose base image.
- `LABEL` - add information about image.
- `COPY` - copy files from build context to image.
- `COPY . /usr/share/nginx/html/` - copy all files from build context to Nginx HTML folder.

## What I learned

- Dockerfile is a file with instructions to build image.
- Image is used to create container.
- I can create my own image based on nginx:alpine.
- Build context is the directory I give to `docker build`.
- The last `.` in `docker build` means current directory.
- `-f` tells Docker where is my Dockerfile.
- `COPY .` copies all files from build context, except files excluded by `.dockerignore`.
- I should use a small build context and copy only files I need.
- `COPY index.html /usr/share/nginx/html/` copies only my HTML file.
- `-p 8081:80` means port 8081 on my computer and port 80 inside container.

## Problems

First I had a problem because Docker command was not working in my WSL terminal. I needed to enable Docker Desktop integration.

I also used wrong paths when I tried to build the image from `~/projects`.

Later I built the image with a build context that was too big. Docker transferred 206 MB.

I used `COPY . /usr/share/nginx/html/`, so many project files were copied into the Nginx HTML directory.

I checked the files with `docker exec` and `ls` and I could see all these files inside the container.

Now I understand that the build context is very important. I should use only my lab directory as context and copy only `index.html`.

## Tomorrow

Try to build my own Docker image again without looking at notes.

Practice `COPY`, build context and `.dockerignore`.
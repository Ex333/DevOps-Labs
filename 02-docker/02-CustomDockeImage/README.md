# Lab 02 - Custom Docker Image

## Objective

Today I wanted to build my own Docker image using a Dockerfile.

I used nginx:alpine as a base image and copied my own HTML page into the image.

## Tasks

- Create my own index.html file.
- Create a Dockerfile.
- Use nginx:alpine as a base image.
- Copy my HTML page into the Nginx web directory.
- Build my own Docker image.
- Run a container from my image.
- Map host port 8080 to container port 80.
- Check if my own page works in the browser.

## What I Learned

- What a Dockerfile is used for.
- How to build my own Docker image.
- How the FROM and COPY instructions work.
- How to run a container from my own image.
- How to test my page in the browser.
- What build context means.
- The last dot in docker build selects the current directory as build context.
- The -f option specifies the Dockerfile location.
- COPY . copies files from the build context into the image.

## Problems

I used a build context that was too big. Docker transferred 206 MB.

I copied too many files into the Nginx HTML directory because I used COPY . instead of copying only index.html.

I checked the container with docker exec and ls and saw many project files inside it.

Now I understand why I should use a smaller build context and copy only the files I need.

## Verification

- Built my own Docker image.
- Started a container from the image.
- Checked files inside the container.
- Verified that the Nginx HTML directory contained the copied files.

## Next Steps

- Build the image again with the correct build context.
- Copy only index.html into the Nginx web directory.
- Use .dockerignore to exclude unnecessary files.
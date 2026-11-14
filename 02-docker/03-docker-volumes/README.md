Docker Volumes - Visit Counter Lab

Goal

The goal of this lab was to learn how Docker volumes work and how to keep application data persistent outside the container.

I created a simple Flask application that counts how many times its main endpoint has been visited.

What I did

Created a simple Flask application using Python.

Created a requirements.txt file with Flask as a dependency.

Created a Dockerfile using python:3.13-slim as the base image.

Installed the application dependencies during the image build.

Created a separate Linux user called appuser.

Configured the container to run as appuser instead of root.

Created a directory /data inside the container for storing application data.

Built a Docker image.

Created a named Docker volume called visit-data.

Started a container and mounted the volume to /data.

Docker Volume

The application stores the visit counter in:

/data/visits.txt

The volume is mounted using:

-v visit-data:/data

This means that the application writes data inside the container, but Docker stores it in a named volume managed by Docker on the host.

To inspect the volume, I used:

docker volume inspect visit-data

To check the files stored in the volume on the host:

sudo ls -lah /var/lib/docker/volumes/visit-data/_data

Running the application

Build the Docker image:

docker build -t 03-docker-volumes-lab:v2 .

Create the named volume:

docker volume create visit-data

Run the container:

docker run -d \
  --name 03_volume_container \
  -p 5000:5000 \
  -v visit-data:/data \
  03-docker-volumes-lab:v2

Testing

I tested the application using curl:

curl http://localhost:5000/

Each request increases the visit counter.

I also checked the stored value directly inside the container:

docker exec -it 03_volume_container cat /data/visits.txt

The file is created automatically when the application receives its first request.

What I learned

How Docker named volumes work.

How to mount a volume inside a container.

The difference between a container filesystem and persistent storage.

Where Docker stores named volumes on the host.

How to inspect Docker volumes.

How to run a container as a non-root user.

How an application can store data in a persistent directory.

Next step

Test data persistence by removing the container, creating a new one with the same named volume and checking if the visit counter keeps its previous value.
# Docker Volumes – Visit Counter

A small Flask application running inside a Docker container. The application counts visits and stores the counter in a Docker named volume.

## Project Overview

The main purpose of this lab was to understand Docker volumes and learn how to store application data outside the container.

The application exposes two HTTP endpoints:

| Endpoint | Description |
|---|---|
| `/` | Increases the visit counter and returns the current value |
| `/health` | Returns the application health status |

## Project Structure

```text
03-docker-volumes/
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
└── README.md
```

## Docker Configuration

The Docker image is based on `python:3.13-slim`.

During the image build, I configured:

- Python dependencies installation.
- A separate Linux user called `appuser`.
- Application files ownership using `COPY --chown`.
- A dedicated `/data` directory.
- Non-root execution using the `USER` instruction.

The application runs as `appuser` instead of root.

## Data Persistence

The application stores the visit counter in:

```text
/data/visits.txt
```

I created a Docker named volume called `visit-data` and mounted it to the `/data` directory inside the container.

```text
Host
└── Docker Volume: visit-data
    └── visits.txt

Container
└── /data
    └── visits.txt
```

This allows the application to keep its data independently of the container lifecycle.

## Build and Run

Build the Docker image:

```bash
docker build -t 03-docker-volumes-lab:v2 .
```

Create the named volume:

```bash
docker volume create visit-data
```

Start the container:

```bash
docker run -d \
  --name 03_volume_container \
  -p 5000:5000 \
  -v visit-data:/data \
  03-docker-volumes-lab:v2
```

## Testing

Check if the container is running:

```bash
docker ps
```

Check the application:

```bash
curl http://localhost:5000/health
```

Increase the visit counter:

```bash
curl http://localhost:5000/
```

Check the stored counter inside the container:

```bash
docker exec -it 03_volume_container cat /data/visits.txt
```

Inspect the Docker volume:

```bash
docker volume inspect visit-data
```

Check the volume files on the host:

```bash
sudo ls -lah /var/lib/docker/volumes/visit-data/_data
```

## What I Learned

During this lab, I learned how to:

- Build a Docker image using a Dockerfile.
- Create and manage named Docker volumes.
- Mount persistent storage inside a container.
- Understand the difference between container storage and persistent storage.
- Inspect Docker volumes and their host location.
- Run containers using a non-root Linux user.
- Manage file ownership and permissions inside containers.

## Next Step

Test volume persistence by removing the container and starting a new one with the same named volume. The visit counter should keep its previous value.
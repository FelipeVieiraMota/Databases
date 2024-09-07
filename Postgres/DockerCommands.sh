# Create a Docker build from scratch
docker build -t postgres -f Dockerfile .

# Run
docker run -d \
  --name postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 \
  -v ./Postgres/volumes:/var/lib/postgresql/data \
  postgres:latest

# Inspect container details
docker inspect postgres

# Enter into the container
docker exec -it postgres /bin/bash 

# Stop all running containers
docker stop $(docker ps -q)

# Remove all containers
docker rm $(docker ps -a -q)

# Remove all Docker images
docker rmi $(docker images -q)

# Optionally, force remove images if they are in use
docker rmi -f $(docker images -q)

# Clean up unused Docker resources
docker system prune -a --volumes
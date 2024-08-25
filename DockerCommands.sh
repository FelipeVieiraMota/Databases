# Create a Docker build from scratch
docker build -t mysql-image -f Dockerfile .

# Run
docker run -d -v $(pwd)/db/data:/var/lib/mysql -p 3306:3306 --rm --name mysqlContainer mysql-image 

# Exec a sql script inside the container automatically
docker exec -i mysqlContainer mysql -uroot -pfelipevieiramota123 < DatabaseCreation.sql

# Inspect container details
docker inspect mysqlContainer

# Enter into the container
docker exec -it mysqlContainer /bin/bash 

# Enter into the mysql inside the container
mysql -uroot -pfelipevieiramota123
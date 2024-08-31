# #######################################################################################################
#  General container's IP = 172.17.0.2                                                                  #
# #######################################################################################################
#   docker ps
#   docker images list
#   docker stop mysql-container
#   docker inspect mysql-container 
#   docker build -t mysql-image -f Dockerfile .
#   docker run -d --rm -p 3306:3306 --name mysql-container mysql-image
#   docker run --rm -p 3306:3306 --name mysql-container mysql-image
#   docker exec -i mysql-container mysql -uroot -pfelipe < script.sql
#   docker exec -it mysql-container /bin/bash
#   docker run -d -v $(pwd)/data:/var/lib/mysql --rm -p 3306:3306 --name mysql-container mysql-image
#   docker run -p 3306:3306 -v $(pwd)/data:/var/lib/mysql --rm --name mysql-container mysql-image
# #######################################################################################################

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

# Kill all containers
docker kill $(docker ps -q)
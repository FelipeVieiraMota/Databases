docker-compose up --build

# use docker ps to check docker's name out, since "mongodb-mongo-1" can change depending on the case.
# docker ps
# docker exec -it <mongodb-mongo-1> mongosh -u root -p example --authenticationDatabase admin
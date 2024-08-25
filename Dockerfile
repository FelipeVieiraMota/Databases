# Use the official PostgreSQL image from Docker Hub
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=test
ENV POSTGRES_DB=postgres

# Expose the PostgreSQL port
EXPOSE 5432

# Optional: Copy an initialization SQL script to the container
# COPY ./init.sql /docker-entrypoint-initdb.d/

# The default command will run the PostgreSQL server
CMD ["postgres"]
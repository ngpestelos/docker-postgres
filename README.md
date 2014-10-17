docker-postgres
===============

PostgreSQL in a Docker container.

### Usage

Build and run the image:

    docker build .
    docker run -P <image-id>

Run `psql` inside the container:

    docker-enter <container-id>
    sudo -i -u psql postgres

In the `psql` console, run these commands:

    ALTER ROLE postgres WITH PASSWORD '<admin-password>';
    CREATE ROLE <user> WITH LOGIN;
    ALTER ROLE <user> WITH PASSWORD '<user-password>';
    CREATE DATABASE <user-database> WITH OWNER <user>;

#Docker

The Corpus can be run inside a [Docker](https://www.docker.com/) container. The Docker container does not support Elasticsearch yet, so the site search functions will not work.

## Setting up the Docker container

1. Download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads).
2. Download and install [Docker](https://www.docker.com/products/docker).
3. Sync the Corpus repository so that you have the latest version from Github.
4. Open your terminal application (Terminal on a Mac).
5. Use the `cd` command to change into the Corpus directory. For example, on my computer:

       cd /Users/benjaminflorin/RubymineProjects/grammars

6. Create a local copy of the database:

       sqlite3 grammars_development.sqlite < grammars_development.sql

7. Build the Docker container:

       docker-compose build

## Running the Docker container

1. Use the `cd` command to change into the Corpus directory. For example, on my computer:

       cd /Users/benjaminflorin/RubymineProjects/grammars

2. Run the Docker container:

       docker-compose up

## Troubleshooting

### Stopping Docker

To stop Docker, press ctrl-c from inside the Terminal where Docker is running.

### Fixing "A server is already running"

Remove the server's `.pid` file. From the `grammars` directory in your Terminal:

    rm tmp/pids/server.pid
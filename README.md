# Docker Image for Running NodeJS Applications

This Docker image provides an easy way to run your NodeJS applications in a container. It comes pre-installed with all the required software, libraries and tools, including Ubuntu, NodeJS, tini, and npm. The exposed ports are 3000, 4200, 80 and 443, and the offered volume is `/apt`.

- tag 2.0 - based on `node:19.6.0-buster-slim` and ported to `ubuntu:jammy-20230126`
- tag 1.0 - based on `node:9-stretch`

## Key Features

- Pre-installed software, libraries and tools:
  + Ubuntu image
  + NodeJS
  + tini
  + npm 
- Exposed ports:
  + 3000
  + 4200
  + 80
  + 443
- Volumes offered in the image:
  + `/apt`
  
## Getting started

1. Pull the image from Docker Hub using the following command:
```
docker image pull asaramet/npm-run
```

2. Start the container, mapping exposed ports to your desired local ports (e.g. `80`), and mount your local folder to the container using the `-v` option. 

For example, to mount the current working directory:
```
docker container run --rm -p 80:80 -v $(pwd):/app asaramet/npm-run
```

Or, to mount the local folder `/path/to/local/folder` to the container's `/app` directory:
```
docker container run --rm -p 4200:4200 -p 80:80 -p 443:443 -v /path/to/local/folder:/app asaramet/npm-run
```

3. Enter a running container using the following commands:
```
# Get the container ID
docker container ls -a

# Start the container interactively
docker container exec -it <CONTAINER_ID> bash 

# Run other commands from your 'package.json', for example 'compile' command: 
npm run compile
```

4. The container will automatically run `npm install` and `npm start` upon launch. You can add this command to your `docker-compose.yml` file for easy configuration. Here is an example:
  ```
  node_server:
    image: asaramet/npm-run
    ports:
      - "3000:3000"
      - "443:443"
      - "80:80"
    volumes:
      - ./node-server:/app
    command: npm install && npm cache clean --force && npm start
  ```

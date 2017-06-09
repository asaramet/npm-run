Default working directory is: "/usr/src/app"

Exposed port: 3000

Application directory should be, therefore, linked to "/usr/src/app", through volumes.

The image assumes that your application have a file named "package.json" listing the dependancies and defining the start script (npm start).

To run the container from the application's folder do:
$ docker run -it --rm --name my_app -p 3000:3000 -v $PWD:/usr/src/app asaramet/npm-run

Configuration example for "docker-compose.yml":

node_server:
  image: asaramet/npm-run
  ports:
  - "3000:3000"
  volumes:
    - ./node-server:/usr/src/app

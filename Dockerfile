FROM node:8
EXPOSE 3000

WORKDIR /usr/src/app

RUN ln -sf /dev/stdout /var/log/node_stdout.log && \
    ln -sf /dev/stderr /var/log/node_stderr.log && \
    npm install

ENTRYPOINT npm start

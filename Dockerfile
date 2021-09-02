FROM mongo:4.2.16-rc0-bionic

EXPOSE 4000

WORKDIR /usr/src/app

COPY . .
RUN apt-get update -y
RUN apt install nodejs -y
RUN apt get npm -y
RUN npm install -g nodemon
RUN npm install

ENTRYPOINT ["/bin/sh", "-c" , "mongod & && npm start"]

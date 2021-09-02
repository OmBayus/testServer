FROM mongo:4.2.16-rc0-bionic

EXPOSE 4000

WORKDIR /usr/src/app

COPY . .
RUN apt-get update -y
RUN apt install nodejs -y
RUN apt install npm -y
RUN npm install -g nodemon
RUN npm install

RUN touch commands.sh
RUN echo "mongod &" >> commands.sh
RUN echo "npm start" >> commands.sh
RUN chmod 777 commands.sh

ENTRYPOINT ["./commands.sh"]

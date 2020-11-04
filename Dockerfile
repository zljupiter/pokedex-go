FROM node:6-alpine
ADD . /app
EXPOSE 5555
WORKDIR /app
RUN npm install
CMD npm start
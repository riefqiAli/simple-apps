FROM node:18.19.0.slim
WORKDIR /app
ADD . .
RUN npm install 
CMD npm start 
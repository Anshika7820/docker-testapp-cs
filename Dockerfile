FROM node

ENV PORT=5050 \
	MONGO_URL=mongodb://mongoadmin:secret@mongo:27017/?authSource=admin

WORKDIR /testapp

COPY package*.json ./
RUN npm install

COPY . /testapp

CMD ["node", "/testapp/server.js"]

# To build the image, run:
# docker build -t testapp:1.0 .

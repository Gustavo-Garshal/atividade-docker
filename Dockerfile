FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
#expondo a porta 3000
EXPOSE 3000
CMD ["node", "app.js"]
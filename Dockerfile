FROM node:16-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --production=false

COPY . .
RUN npm run build

RUN npm install -g serve pm2

EXPOSE 3000

CMD ["pm2-runtime", "start", "npx", "--", "serve", "-s", "build", "-l", "3000"]

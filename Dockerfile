FROM node:16-alpine
WORKDIR /app
# Copy package files
COPY package*.json ./
# Fix for old projects with fsevents/macOS dependencies
RUN npm install --legacy-peer-deps --no-optional
# Copy source code
COPY . .
# Build the production app
RUN npm run build
# Install a lightweight static file server
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]

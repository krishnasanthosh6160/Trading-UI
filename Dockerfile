FROM node:16-alpine
WORKDIR /app
<<<<<<< HEAD

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

=======
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
>>>>>>> b99ab4958412579e3a02ce899612331d9807a0fa
CMD ["serve", "-s", "build", "-l", "3000"]

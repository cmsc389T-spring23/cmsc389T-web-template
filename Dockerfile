# Use the node:10-alpine image as a base
FROM node:10-alpine

# Create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

# Install all packages in package.json
COPY package*.json ./
USER node
RUN npm install

# Copy the rest of the application
COPY --chown=node:node . .

# Expose port 8080 and run the app
EXPOSE 8080
CMD ["node", "app.js"]

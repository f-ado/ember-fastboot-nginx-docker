FROM node:14.4.0-alpine3.10

WORKDIR /usr/app

# Install PM2 globally
RUN npm install --global pm2

# Copy all files
COPY ./ ./

# Install dependencies and build ember-fastboot-app
WORKDIR /usr/app/ember-fastboot-app
RUN yarn
RUN yarn build-prod

# Install dependencies and run ember-fastboot-app-server
WORKDIR /usr/app/ember-fastboot-app-server
RUN yarn

# Run container as non-root user
# The node user is provided in the Node.js Alpine base image
USER node

# Run npm start script with PM2 when container starts
CMD [ "pm2-runtime", "npm", "--", "start" ]
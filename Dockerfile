FROM node:14.4.0-alpine3.10

WORKDIR /usr/app

# Install PM2 globally
RUN npm install --global pm2

RUN mkdir /usr/app/ember-fastboot-app/
COPY ./ember-fastboot-app/package.json /usr/app/ember-fastboot-app/
COPY ./ember-fastboot-app/yarn.lock /usr/app/ember-fastboot-app/
WORKDIR /usr/app/ember-fastboot-app
RUN yarn

RUN mkdir /usr/app/ember-fastboot-app-server/
COPY ./ember-fastboot-app-server/package.json /usr/app/ember-fastboot-app-server/
COPY ./ember-fastboot-app-server/yarn.lock /usr/app/ember-fastboot-app-server/
WORKDIR /usr/app/ember-fastboot-app-server
RUN yarn

WORKDIR /usr/app
COPY ./ ./

WORKDIR /usr/app/ember-fastboot-app
RUN yarn build-prod

# Run container as non-root user
# The node user is provided in the Node.js Alpine base image
USER node

WORKDIR /usr/app/ember-fastboot-app-server
# Run npm start script with PM2 when container starts
CMD [ "pm2-runtime", "npm", "--", "start" ]
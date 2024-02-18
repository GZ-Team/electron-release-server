FROM node:19

# Create app directory
WORKDIR /usr/src/electron-release-server

# Install app dependencies
COPY package.json .bowerrc bower.json /usr/src/electron-release-server/
RUN pnpm install \
  && ./node_modules/.bin/bower install --allow-root \
  && pnpm cache clean --force \
  && pnpm prune --production

# Bundle app source
COPY . /usr/src/electron-release-server

COPY config/docker.js config/local.js

EXPOSE 80

CMD [ "pnpm", "start" ]

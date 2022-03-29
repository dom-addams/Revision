FROM node:15

# Create app directory
WORKDIR /usr/

# Install app dependencies
COPY package*.json ./

# Install YARN for app
RUN yarn install

# Copy app source
COPY . .

# Expose Port 
EXPOSE 3000

# YARN available at path
# '/usr/local/bin/yarn'

# Install Project
RUN yarn build && yarn global add serve

ENTRYPOINT serve -s build
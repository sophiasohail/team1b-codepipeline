# pull official base image
FROM public.ecr.aws/docker/library/node:16.18.1-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json /app
COPY package-lock.json /app
COPY src /app
COPY public /app
COPY todo-data.json /app
RUN npm install
#RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . /app

# Make port 3000 available to the world outside this container
EXPOSE 3000

# start app
CMD ["npm", "start"]
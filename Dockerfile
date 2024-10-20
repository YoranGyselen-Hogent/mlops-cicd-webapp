# Base image
FROM node:lts-alpine

# Create a directory and set it as the workdir
RUN mkdir /app
WORKDIR /app

# Copy the files used to manage dependencies and install them
COPY yarn.lock package.json ./
RUN yarn install --frozen-lockfile

# Copy the application
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
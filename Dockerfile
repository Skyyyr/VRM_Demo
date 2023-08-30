# Use an official Ruby runtime as a parent image
FROM ruby:3.2

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Sinatra and MongoDB Ruby Driver
RUN gem install sinatra webrick mongo

# Make port 4567 available to the world outside this container
EXPOSE 4567

# Define environment variable for MongoDB
ENV MONGO_URL mongodb://mongo:27017/mydb

# Run app.rb when the container launches
CMD ["ruby", "app.rb"]

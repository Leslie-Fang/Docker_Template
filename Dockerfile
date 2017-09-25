# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

ENV http_proxy http://child-prc.intel.com:913
ENV https_proxy https://child-prc.intel.com:913

# RUN python get-pip.py --proxy "http://proxy-chain.intel.com:911"
# Install any needed packages specified in requirements.txt
# RUN pip install numpy --proxy "http://proxy-chain.intel.com:911"
RUN pip install -r requirements.txt --proxy "http://proxy-chain.intel.com:911"

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

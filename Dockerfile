
FROM python:3.10-slim-buster

WORKDIR /app

COPY . /app

#Install the dependency 
RUN pip install -r requirements.txt

# Expose the port that the application will listen on
EXPOSE 5000

# Start the application using the command passed in from the docker run command
CMD ["sh", "-c", "PORT=${PORT:-5000} python main.py"]

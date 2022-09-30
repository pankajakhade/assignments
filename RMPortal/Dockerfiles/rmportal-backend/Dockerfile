FROM python:3.6.15-slim-buster

#Setting a working directory
WORKDIR /python-docker

# Copy requirments.txt file
COPY requirements.txt requirements.txt

# Run requirements
RUN pip3 install -r requirements.txt

# Copy Python code
COPY . .

# Execute flask app
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
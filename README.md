
# Intuji DevOps Internship Challenge

## Project Description

This project is part of the Intuji DevOps Internship Challenge. The tasks include setting up Docker, Jenkins, and a CI/CD pipeline to automate the build and deployment of a simple PHP web application. The repository contains a Dockerfile, docker-compose.yml, and Jenkins setup script to automate the process.

## Prerequisites

- A Linux machine (VM or physical) with sudo privileges
- Basic knowledge of Git, Docker, and Jenkins
- A Docker Hub account
- Jenkins installed on your machine
- Git installed on your machine

## Installation Steps

### Docker Installation

1. Create a bash script to install Docker on a Linux machine. Save the following script as `install_docker.sh`:

    ```bash
    #!/bin/bash

    # Update package index and install prerequisites
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker's stable repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update package index again
    sudo apt update

    # Install Docker
    sudo apt install -y docker-ce

    # Enable and start Docker service
    sudo systemctl enable docker
    sudo systemctl start docker

    # Verify Docker installation
    sudo docker --version
    ```

2. Run the script:

    ```bash
    chmod +x install_docker.sh
    ./install_docker.sh
    ```

### Cloning the Repository

Clone the GitHub repository to your local machine:

```bash
git clone https://github.com/Nischalpradhan13/intuji-devops-internship-challenge.git
cd intuji-devops-internship-challenge
 ```


### Building and Running the Docker Image

### Create a Dockerfile for the PHP Application:

Create a `Dockerfile` in your project directory with the following content:

```Dockerfile
FROM php:7.4-apache

# Copy application files to the web directory
COPY . /var/www/html/

# Expose port 80
EXPOSE 80
```
### Build the Docker Image:

````Docker build
docker build -t nischalpdh/php-hello-world .
````

### Pushing the Docker Image to Docker Hub
Log in to Docker Hub:
````docker login
docker login -u <your_dockerhub_username> -p <your_dockerhub_password>

````
Push the Docker Image:
````push image
docker push nischalpdh/php-hello-world
````

### Docker Compose Setup

Create a docker-compose.yml File:
````docker compose
version: '3.8'

services:
  web:
    image: nischalpdh/php-hello-world
    ports:
      - "80:80"

````
Run the Docker Compose Application:
````
docker-compose up -d
````

## Setting Up Jenkins for CI/CD

### Install Jenkins:
Follow the official Jenkins documentation to install Jenkins on your machine: [Jenkins Installation Guide](https://www.jenkins.io/doc/book/installing/)

### Install Necessary Plugins:
Install the following Jenkins plugins:
- Git Plugin
- Docker Pipeline Plugin

### Create a Freestyle Project:
1. Go to Jenkins Dashboard and click on "New Item".
2. Name the project `intuji-devops-internship-challenge`.
3. Select "Freestyle project" and click "OK".

### Configure Source Code Management:
1. Under "Source Code Management", select "Git".
2. Enter the repository URL: `https://github.com/Nischalpradhan13/intuji-devops-internship-challenge.git`.
3. Add credentials if necessary.


### Add Build Steps:

Under "Build", add a build step to "Execute shell" with the following commands:

````
# Log in to Docker Hub using environment variables
echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin

# Build the Docker image
docker build -t nischalpdh/php-hello-world $WORKSPACE

# Push the Docker image to Docker Hub
docker push nischalpdh/php-hello-world

# Log out of Docker Hub
docker logout
````
## Configure Build Environment:
1. Under "Build Environment", check "Use secret text(s) or file(s)".
2. Add "Username and password (separated)" and configure it to use your Docker Hub credentials.
3. Set the "Username Variable" to `DOCKER_HUB_USERNAME` and "Password Variable" to `DOCKER_HUB_PASSWORD`.

### Save and Apply Configuration:
Save the Jenkins job configuration.

## Running the Pipeline
1. Go to Jenkins Dashboard.
2. Select your project (`intuji-devops-internship-challenge`).
3. Click on "Build Now" to run the pipeline.
4. Monitor the build process in the "Console Output" to ensure everything runs smoothly.



## Screenshots of final output
Jenkins job build success, Docker image being built and pushed to Docker Hub

![Build Success](https://github.com/Nischalpradhan13/intuji-devops-internship-challenge/assets/117845810/277ad13b-0ca0-47cd-922c-fe8c40ad64e3)


![docker image build](https://github.com/Nischalpradhan13/intuji-devops-internship-challenge/assets/117845810/9c98e2e9-c768-443b-8592-cf00d76bd7c5)


![Docker HuB](https://github.com/Nischalpradhan13/intuji-devops-internship-challenge/assets/117845810/0b9d4818-116e-4a91-b3be-b5a7f4047bc7)

## Troubleshooting

### Common Issues and Solutions

#### Docker Permission Issues:
- Ensure the Jenkins user is added to the Docker group:
  'sudo usermod -aG docker jenkins'
- Restart Jenkins to apply group changes: sudo systemctl restart jenkins


 #### Docker Hub Login Issues:

 - Verify that your Docker Hub credentials are correct.
 - Ensure environment variables are correctly set in Jenkins.

#### Build Failures:
 - Check the Jenkins console output for detailed error messages.
 - Ensure your Dockerfile and docker-compose.yml are correctly configured.

## Conclusion
 This project demonstrates how to set up a CI/CD pipeline using Docker and Jenkins. By following the steps outlined, you can automate the build, push, and deployment process for a simple PHP web application. This setup can be extended to more complex applications and workflows

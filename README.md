
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


## Building and Running the Docker Image

### Create a Dockerfile for the PHP Application:

Create a `Dockerfile` in your project directory with the following content:

```Dockerfile
FROM php:7.4-apache

# Copy application files to the web directory
COPY . /var/www/html/

# Expose port 80
EXPOSE 80





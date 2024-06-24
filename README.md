# docker-robotframework
Running Robotframework inside Docker container

> docker build -t testenv:latest .

## Run test with Docker Compose

> 1. docker run --name test --rm -v .:/robot -e "BROWSER=chrome" -e "BROWSER_VERSION=stable" testenv:latest

# docker-robotframework
Running Robotframework inside Docker container

### First, need to build test environment

> docker build -t testenv:latest .

### Run test with Docker Compose

> docker run --name test --rm -v .:/robot -e "BROWSER=chrome" -e "BROWSER_VERSION=stable" testenv:latest

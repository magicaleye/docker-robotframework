# docker-robotframework

Running Robotframework inside Docker container

## First, need to build test environment

> docker build -t testenv:latest .

## Run your tests

> docker run --name test --rm -v .:/robot testenv:latest

### Note

1. You may need to grant permissions to run_suite.sh
    > chmod u+x run_suite.sh
2. Add tag if needed
    > docker run --name test --rm -v .:/robot -e "TAG=-i YOUR_TAG" testenv:latest
3. Change browser (chrome, edge, firefox) and browser version if needed (stable, dev, beta, canary). Default: chrome stable
    > docker run --name test --rm -v .:/robot -e "BROWSER=firefox" -e "BROWSER_VERSION=stable" testenv:latest
4. You can also run the tests using docker compose, it's easier than using docker run
    > docker compose up "service"

    Modify "service" to run specific service in docker compose file, if you do not input anything, it will run all services

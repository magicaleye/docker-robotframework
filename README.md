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
    > docker compose up [service1] [service2]

    Modify "service" to run specific service in docker compose file, if you do not input anything, it will run all services
5. If you want to modify environment variable and use docker compose to run
    > docker compose run -e [VARIABLE1]=[value1] -e [VARIABLE2]=[value2] [service]
6. If you want to rerun failed tests, put variable [-e rerun=true] into your run command
    > docker run --name test --rm -v .:/robot -e "TAG=-i YOUR_TAG" -e RERUN=true testenv:latest

    > docker compose run -e RERUN=true [service]

7. `docker compose run` can be used with one service, so it's not possible to rerun multiple services like `docker compose up`. You have to repeat `docker compose run -e RERUN=true [service]` to rerun your failed tests
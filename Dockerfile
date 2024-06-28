FROM python:3.12.4-slim

RUN apt-get update && apt-get install -y chromium

RUN python3 -m pip install robotframework \
    robotframework-seleniumlibrary \
    selenium \
    robotframework-requests \
    robotframework-jsonlibrary

WORKDIR /robot

ENV BROWSER="chrome" BROWSER_VERSION="stable" TAG="" OUTPUT_DIR="./reports" RERUN="false"

CMD ["/robot/run_suite.sh"]

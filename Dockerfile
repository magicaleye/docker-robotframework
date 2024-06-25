FROM python:3.12.4-slim

RUN apt-get update && apt-get install -y chromium

RUN python3 -m pip install robotframework \
    robotframework-seleniumlibrary \
    selenium \
    robotframework-requests \
    robotframework-jsonlibrary

WORKDIR /robot 
COPY ./run_suite.sh /robot/run_suite.sh
RUN chmod u+x /robot/run_suite.sh
VOLUME /robot

ENV BROWSER="chrome" BROWSER_VERSION="stable" TAG="" OUTPUT_DIR="./reports"

CMD ["/robot/run_suite.sh"]

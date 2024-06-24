FROM python:3.12.4-bookworm

RUN apt-get update \
    && apt-get install -y xvfb wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
    libatspi2.0-0 libcups2 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 \
    libxcomposite1 libxkbcommon0 libxrandr2 xdg-utils ntpdate openssl libu2f-udev

RUN python3 -m pip install robotframework \
    robotframework-seleniumlibrary \
    selenium

# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
# RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#     && dpkg -i google-chrome*.deb \
#     && rm google-chrome*.deb 

WORKDIR /robot 
COPY ./scripts/run_suite.sh /robot/scripts/run_suite.sh
RUN chmod u+x /robot/scripts/run_suite.sh
VOLUME /robot

ENV BROWSER="chrome" BROWSER_VERSION="stable" headless="True" TAG=""

CMD ["/robot/scripts/run_suite.sh"]

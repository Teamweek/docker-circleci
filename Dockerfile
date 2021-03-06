FROM circleci/ruby:2.5.0-node

USER root

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update
RUN apt-get install -y \
    libasound2 \
    libgtk-3-0 \
    gconf-service \
    libgconf-2-4 \
    libnspr4 \
    libxss1 \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    xdg-utils \
    libxtst6 \
    lsb-release \
    google-chrome-stable

RUN export CHROME_RELEASE=`google-chrome --version | grep -iEo "[0-9.]{10,20}" | sed 's/\.[^.]*$//'` \
      && export CHROME_DRIVER_RELEASE=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_RELEASE}` \
      && curl --silent --show-error --location --fail --retry 3 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_RELEASE/chromedriver_linux64.zip" \
      && cd /tmp \
      && unzip chromedriver_linux64.zip \
      && rm -rf chromedriver_linux64.zip \
      && mv chromedriver /usr/local/bin/chromedriver \
      && chmod +x /usr/local/bin/chromedriver \
      && chromedriver --version

USER circleci

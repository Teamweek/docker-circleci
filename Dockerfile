FROM circleci/ruby:2.5.0-node
ADD ./chrome64_63.0.3239.108.deb /

USER root

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
    lsb-release

RUN dpkg -i /chrome64_63.0.3239.108.deb
RUN apt-get install -f

# Install ChromeDriver
RUN export CHROMEDRIVER_RELEASE=2.33 \
      && curl --silent --show-error --location --fail --retry 3 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_RELEASE/chromedriver_linux64.zip" \
      && cd /tmp \
      && unzip chromedriver_linux64.zip \
      && rm -rf chromedriver_linux64.zip \
      && mv chromedriver /usr/local/bin/chromedriver \
      && chmod +x /usr/local/bin/chromedriver \
      && chromedriver --version

USER circleci

FROM node:10.15.2-stretch

ENV KIBANA_VERSION 7.3.1
## Then you have to rebuild image it`s better to copy the sources, not the repo
RUN curl -k https://codeload.github.com/elastic/kibana/tar.gz/v$KIBANA_VERSION | tar -xz

### jenkins set up ###
RUN adduser --home /home/jenkins --shell /bin/bash jenkins

RUN npm install yarn -g && \
    sed -i 's|require|//require|g' /kibana-$KIBANA_VERSION/scripts/register_git_hook.js && \
    chown jenkins:jenkins -R /kibana-$KIBANA_VERSION && \
    mv -f /kibana-$KIBANA_VERSION /tmp/kibana

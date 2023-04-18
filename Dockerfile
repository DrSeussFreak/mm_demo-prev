# Copyright (c) 2016-present Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.
FROM mysql:5.7-debian

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
RUN apt-get update && apt-get install -y ca-certificates

#
# Configure SQL
#

ENV MYSQL_ROOT_PASSWORD=mostest
ENV MYSQL_USER=mmuser
ENV MYSQL_PASSWORD=mostest
ENV MYSQL_DATABASE=mattermost_test

#
# Configure Mattermost
#
WORKDIR /mm

# Copy over files
ADD https://releases.mattermost.com/7.9.2/mattermost-team-7.9.2-linux-amd64.tar.gz .
RUN tar -zxvf mattermost-team-*-linux-amd64.tar.gz
ADD config_docker.json ./mattermost/config/config_docker.json
ADD docker-entry.sh .

RUN chmod +x ./docker-entry.sh
ENTRYPOINT ./docker-entry.sh

# Mattermost environment variables
ENV PATH="/mm/mattermost/bin:${PATH}"

# Create default storage directory
RUN mkdir ./mattermost-data
VOLUME /mm/mattermost-data

# Ports
EXPOSE 8065

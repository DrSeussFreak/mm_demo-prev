# Mattermost Docker Preview Image

This is a Docker image to install Mattermost in *Preview Mode* for exploring product functionality on a single machine using Docker.

Note: This configuration should not be used in production, as it’s using a known password string and contains other non-production configuration settings, and it does not support upgrade. If you’re looking for a production installation with Docker, please see the [Mattermost Production Docker Deployment Guide](http://docs.mattermost.com/install/prod-docker.html).

To contribute, please see [Contribution Guidelines](https://docs.mattermost.com/developer/contribution-guide.html).

To file issues, [search for existing bugs and file a GitHub issue if your bug is new](https://www.mattermost.org/filing-issues/).

## Usage

Please see [documentation for usage](http://docs.mattermost.com/install/docker-local-machine.html).

If you have Docker already set up, you can run this image in one line:

```
5) The preview image is using "postgres:12" in the Dockerfile, this has known issues and should be updated to be "postgres:12-bullseye"
   a) I created a custom fork, fixed the Dockerfile, cloned it locally and built the image, and then ran the container.
      i) docker build --tag 'mattermost_preview' .
      ii) docker run --detach --name mattermost-preview -d --publish 8065:8065 --add-host dockerhost:127.0.0.1 'mattermost-preview'
```

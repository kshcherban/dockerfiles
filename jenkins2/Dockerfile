FROM jenkins:2.19.3
MAINTAINER k.scherban@gmail.com

# Set Java opts
#ENV JAVA_OPTS="-Xmx2048m"

# Preinstall plugins
RUN /usr/local/bin/install-plugins.sh \
    google-login \
    role-strategy \
    matrix-auth \
    github-oauth \
    github \
    git \
    s3 \
    amazon-ecs \
    amazon-ecr \
    docker-workflow \
    workflow-aggregator \
    job-dsl \
    swarm \
    ssh-slaves \
    email-ext \
    envinject \
    docker-build-publish

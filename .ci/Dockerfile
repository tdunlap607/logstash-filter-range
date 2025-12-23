ARG LOGSTASH_VERSION
FROM docker.elastic.co/logstash/logstash:${LOGSTASH_VERSION}

USER root
RUN apt-get update && apt-get install -y sudo && \
    usermod -aG sudo logstash && \
    echo "logstash ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER logstash

# Copy plugin files
COPY --chown=logstash:logstash Gemfile *.gemspec VERSION* /usr/share/plugins/plugin/
COPY --chown=logstash:logstash .ci /usr/share/plugins/plugin/.ci

WORKDIR /usr/share/plugins/plugin

ENV PATH="/usr/share/logstash/vendor/jruby/bin:/usr/share/logstash/vendor/bundle/jruby/3.1.0/bin:${PATH}"
ENV LOGSTASH_SOURCE="1"
ENV LOGSTASH_PATH="/usr/share/logstash"

# Install dependencies
RUN .ci/setup.sh

# Copy remaining plugin files
COPY --chown=logstash:logstash . /usr/share/plugins/plugin

CMD [".ci/run.sh"]

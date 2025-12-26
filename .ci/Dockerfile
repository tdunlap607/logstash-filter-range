ARG LOGSTASH_VERSION
FROM docker.elastic.co/logstash/logstash:${LOGSTASH_VERSION}

ENV LOGSTASH_SOURCE="1"
ENV LOGSTASH_PATH="/usr/share/logstash"

# Copy plugin files
COPY --chown=logstash:logstash . /usr/share/plugins/plugin

WORKDIR /usr/share/plugins/plugin

# Install dependencies using Logstash's bundler
RUN /usr/share/logstash/bin/ruby -S bundle install

# Run tests
CMD ["/usr/share/logstash/bin/ruby", "-S", "bundle", "exec", "rake", "test"]

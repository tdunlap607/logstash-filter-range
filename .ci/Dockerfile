ARG LOGSTASH_VERSION
FROM docker.elastic.co/logstash/logstash:${LOGSTASH_VERSION}

ENV LOGSTASH_SOURCE="1"
ENV LOGSTASH_PATH="/usr/share/logstash"

# Copy plugin files
COPY --chown=logstash:logstash . /usr/share/plugins/plugin

WORKDIR /usr/share/plugins/plugin

# Install bundler and dependencies
ENV PATH="/usr/share/logstash/vendor/bundle/jruby/2.5.0/bin:${PATH}"
RUN /usr/share/logstash/bin/ruby -S gem install bundler -v 2.3.27 && \
    /usr/share/logstash/bin/ruby -S bundle install

# Run tests
CMD ["/usr/share/logstash/bin/ruby", "-S", "bundle", "exec", "rake", "test"]

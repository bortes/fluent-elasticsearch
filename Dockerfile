FROM fluent/fluentd:v0.14

# https://github.com/fluent/fluentd-docker-image#3-customize-dockerfile-to-install-plugins-optional
# install fluent plugin
RUN    apk add --update --virtual .build-deps sudo build-base ruby-dev \
    && gem install fluent-plugin-elasticsearch --no-document \
    && gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /home/fluent/.gem/ruby/2.3.0/cache/*.gem

# fluent config 
COPY fluent-to-elasticsearch.conf /fluentd/etc/

# new config
ENV FLUENTD_CONF=fluent-to-elasticsearch.conf

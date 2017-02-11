FROM docksal/bitbucket-pipelines-agent

# Switch to root to install some system-wide stuff
USER root

RUN apk add --update --no-cache \
    php7 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-phar \
    php7-xml \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/bin/php7 /usr/bin/php

ENV COMPOSER_VERSION 1.3.0
ENV DRUSH_VERSION 8.1.9
ENV DRUPAL_CONSOLE_VERSION 1.0.0-rc15
ENV WPCLI_VERSION 1.1.0
RUN \
    # Composer
    curl -sSL "https://github.com/composer/composer/releases/download/${COMPOSER_VERSION}/composer.phar" -o /usr/local/bin/composer && \
    # Drush 8 (default)
    curl -sSL "https://github.com/drush-ops/drush/releases/download/${DRUSH_VERSION}/drush.phar" -o /usr/local/bin/drush && \
    # Drupal Console
    curl -sSL "https://github.com/hechoendrupal/drupal-console-launcher/releases/download/${DRUPAL_CONSOLE_VERSION}/drupal.phar" -o /usr/local/bin/drupal && \
    # Install wp-cli
    curl -sSL "https://github.com/wp-cli/wp-cli/releases/download/v${WPCLI_VERSION}/wp-cli-${WPCLI_VERSION}.phar" -o /usr/local/bin/wp && \
    # Make all binaries executable
    chmod +x /usr/local/bin/*

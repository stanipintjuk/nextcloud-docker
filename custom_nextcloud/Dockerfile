# Adds cron and memcache capability to the nextcloud image.
# Starts cron and nextcloud using supervisord.
FROM nextcloud

# install cron, supervisord and memcached TODO remove vi
RUN apt-get update && apt-get install -y \
  supervisor \
  cron \
  memcached \
  php5-memcached \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/log/supervisord /var/run/supervisord && \ 
  echo "*/15 * * * * su - www-data -s /bin/bash -c \"php -f /var/www/html/cron.php\""| crontab -

COPY supervisord.conf /etc/supervisor/supervisord.conf

CMD [ "/usr/bin/supervisord"]

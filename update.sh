#!/bin/bash
# Copy last log to old
cat update.log >> updatelog.old

# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-

# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>update.log

# Redirect STDERR to STDOUT
exec 2>&1

cd /root/nextcloud
echo "# Pulling latest images"
/usr/bin/docker-compose pull
echo ""
echo "# Building docker-compose.yml"
/usr/bin/docker-compose build --pull
echo ""
echo "# Starting docker-compose.yml"
/usr/bin/docker-compose up -d --remove-orphans 
/bin/echo ""
/bin/date
/bin/echo ===================================== 

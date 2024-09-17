#!/bin/sh

# Start cron
/usr/sbin/cron -f &

# Start the ClamAV daemon
/usr/sbin/clamd -c /etc/clamav/clamd.conf &

# Keep the container running
tail -f /dev/null

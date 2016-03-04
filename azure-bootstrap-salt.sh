#!/bin/sh
# Wrapper to bootstrap Salt and add settings to keep connection alive

/bin/sh bootstrap-salt.sh $@
cat << EOF > /etc/salt/minion.d/42-keepalive.conf
ping_interval: 1
tcp_keepalive: True
tcp_keepalive_idle: 120
EOF
/usr/sbin/service salt-minion restart
exit 0

#!/bin/bash
if [ ! -e /etc/yum.repos.d/influxdb.repo ]; then
echo "#### Configuration repo for InfluxDB:"
cat <<EOF | tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
fi

if ! rpm -q telegraf; then
  echo "#### Telegraf Installation:"
  dnf -y install telegraf jq
fi

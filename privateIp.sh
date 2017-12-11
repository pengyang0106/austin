#!/bin/bash
#
# This script registers the current appliance VM with Triton Manager on-premise
# via a POST to the REST API
#

new_ip_address=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1);

my_hostname=`hostname -s`;

tritonIp=$1;
registrationToken=$2;

data_to_send="{\"privateIpAddress\": \"$new_ip_address\", \"hostname\":\"$my_hostname\", \"tritonIp\":\"$tritonIp\", \"registrationToken\":\"$registrationToken\"}";

logger $data_to_send;

curl -k -v -H "Content-Type: application/json" -X POST -d "$data_to_send" "https://$tritonIp/registration";


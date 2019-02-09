#!/bin/sh

echo "Generating NGINX config file"
export DOLLAR='$'
envsubst < /etc/nginx/conf.d/jenkins.template > /etc/nginx/conf.d/jenkins.conf

echo "Starting entrypoint"
/scripts/entrypoint.sh

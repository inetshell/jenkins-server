#!/usr/bin/env bash
export SCRIPT_HOME="$( cd "$(dirname "${0}")" ; pwd -P )"
export VARS_FILE="${SCRIPT_HOME}/vars/load_vars.sh"
export PLUGINS_FILE="${SCRIPT_HOME}/vars/plugins.txt"

if [[ -f "${VARS_FILE}" ]]; then
    echo "Loading variables file ${VARS_FILE}"
    source "${VARS_FILE}"
fi

if [[ -f "${PLUGINS_FILE}" ]]; then
    echo "Loading plugins file ${PLUGINS_FILE}"
    cat "${PLUGINS_FILE}" > "jenkins-server/plugins.txt"
fi

if [[ -z "${CERTBOT_EMAIL}" ]] || [[ -z ${JENKINS_DNS} ]]; then
    echo "CERTBOT_EMAIL, JENKINS_DNS variables are not defined"
    exit 1
fi

# Create and configure container directories
mkdir -p jenkins-proxy/log/
mkdir -p jenkins-server/home/
chmod 770 jenkins-server/home/
chown 1000:1000 jenkins-server/home/

docker-compose pull
docker-compose --project-name 'jenkins' up --build -d

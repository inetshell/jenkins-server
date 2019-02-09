FROM staticfloat/nginx-certbot:latest

COPY jenkins.template /etc/nginx/conf.d/
COPY gen_config.sh /scripts/gen_config.sh
RUN chmod 755 /scripts/gen_config.sh
CMD ["/bin/bash", "/scripts/gen_config.sh"]

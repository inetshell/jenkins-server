# Jenkins Server Deployment

Jenkins LTS with the following configuration:
- HTTPS support with Let's Encrypt certificate
- Ansible, Terraform and Docker tools 
- Tested on CentOS 7.5

## Requirements:
* docker-ce-18.06.x
* docker-compose

## To Jenkins plugins
Create a file vars/plugins.txt with required plugins, one per line.

## To deploy:
```
chmod u+x deploy.sh
export CERTBOT_EMAIL=info@example.com
export JENKINS_DNS=jenkins.example.com
./deploy.sh
```

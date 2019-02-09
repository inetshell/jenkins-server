FROM jenkins/jenkins:lts
USER root

# Install Docker and config sudo for Jenkins user
RUN apt-get update && \
    apt-get install -y vim apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y docker-ce=18.06.1~ce~3-0~debian containerd.io && \
    echo "jenkins ALL=(ALL) NOPASSWD: /usr/bin/docker" > /etc/sudoers.d/docker

# Install Ansible
RUN apt-get update && apt-get install -y ansible

# Install Terraform
ENV TERRAFORM_VERSION 0.11.11
RUN curl -s -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
	rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    terraform version

USER jenkins
WORKDIR /var/jenkins_home/
RUN echo "alias docker='sudo docker'" >  ~/.bashrc

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

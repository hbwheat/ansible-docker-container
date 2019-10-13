FROM centos:7.6.1810 as baseAnsible
USER root
RUN yum update -y > /dev/null && yum install -y \
python3-pip \
git \
ansible \
sudo > /dev/null && \
yum clean all > dev/null && \
rm -rf /var/cache/yum > /dev/null
#set these in a docker-compose file and .env file

FROM baseAnsible
ARG ANSIBLE_USER=ansible
ARG ANSIBLE_FILES=ansiblefiles
RUN curl -o /etc/bash_completion.d/ansible-completion.bash https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-completion.bash >> dev/null
RUN adduser ${ANSIBLE_USER} && \
chown -R ${ANSIBLE_USER}:root /home/${ANSIBLE_USER}/ && \
mkdir "/home/${ANSIBLE_USER}/${ANSIBLE_FILES}" && \
echo "export ANSIBLE_HOME="/home/${ANSIBLE_USER}/${ANSIBLE_FILES}"" >> /etc/profile.d/misc-ansible-docker.sh
USER ${ANSIBLE_USER}
#RUN git clone https://github.com/kubernetes-sigs/kubespray.git
#WORKDIR /home/$user/kubespray
#USER root
#RUN pip3 install -r requirements.txt
WORKDIR /home/${ANSIBLE_USER}
USER ${ANSIBLE_USER}
CMD tail -F "/home/whe-mac/ansiblefiles/ansible.log"
#ENTRYPOINT tail -f /dev/null


# ansible-docker-container
Dockerfile, docker-compose, and instructions to learn Ansible from a container. 

## Get This Running
1. Pull the repo

2. Edit the .env files with your usernmae(ANSIBLE_USER) and desired path for ansible files on your host. I'm using a bind mound to local storage to quickly edit ansible files on my host. Then the container runtime will see those changes. 

3. Make sure you send your .ssh folder to the container as well. 

4. ``docker-compose config``to make sure all the variables have worked correctly. 

5. ``docker-compose up --build `` to build the image and launch the service

5. ``docker exec -it ansible_runner bash`` in a sperate terminal tab to get cli access to the Ansible container. 

6. ``ansible test -m ping -i ansiblefiles/inventory`` to test the install.

---

Commented out a bunch of lines in kubespray ```./kubespray/mycluser/group_vars_all/all.yml``` and in ```./kubespray/mycluser/k8s-cluster/k8s-cluster.yml```. Also some lines in ```k8s-net-calico.yml``` too.

## Kubespray Commands

### Pre-reqs
1. Added my user on each node
2. Added my user to wheel group
3. Added my user ssh keys to each node

1. sudo pip3 install -r requirements.txt
2. cp -rfp inventory/sample inventory/mycluster
3. declare -a IPS=(192.168.1.169)
4. CONFIG_FILE=inventory/mycluster/hosts.yml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
5. Reviewed: Review and change parameters under ``inventory/mycluster/group_vars``
6. ansible-playbook -i inventory/mycluster/hosts.yml --become --ask-sudo-pass cluster.yml

ansible-playbook -i inventory/mycluster/hosts.yml remove-node.yml --become --ask-sudo-pass -v --extra-vars "node=node1,node2"


### todo: 
1. fix kubespray not cloning into image and pip requirments not running 

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

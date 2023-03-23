sudo docker rm -f $(docker ps -aq)
sudo docker rmi -f $(docker image ls -aq)

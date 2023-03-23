sudo docker rm -f $(docker ps -aq)
sudo docker image rm -f $(docker image ls -aq)

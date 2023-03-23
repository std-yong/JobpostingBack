sudo Docker rm -f $(docker ps -aq)
sudo Docker rmi -f $(docker image ls -aq)

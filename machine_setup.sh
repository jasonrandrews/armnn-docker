#!/bin/bash  
 
# 
# script to setup new machine 
# 
# install aws cli, git, docker, and remote sublime 
# 
# meant to be run at first ssh (as user) 
 
# assuming ec2 user ubuntu,  
SUSER=ubuntu 
 
[ -z "$USER" ] && USER=`whoami` 
 
# if user is not ubuntu (and not root) then change user name to current user 
if [ $USER != $SUSER -a $USER != "root" ]; then 
    echo "adjusting username to $USER" 
    SUSER=$USER 
fi 
 
SHOME=/home/$SUSER 
 
# Install pre-reqs  
sudo apt-get update -y  
sudo apt-get install -y git xfce4 xfce4-terminal firefox 
  
# install docker 
dpkg -s docker-ce &> /dev/null 
 
if [ $? -eq 0 ]; then 
    echo "Docker already installed!" 
else 
    curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh 
    sudo usermod -aG docker $SUSER 
fi 
 
# only for AWS machines 
if [ $USER = "ubuntu" ]; then 
    # enable password login 
    sudo sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config 
    # keep alive so ssh connections don't timeout 
    sudo sed -i '/ClientAliveInterval 0/c\ClientAliveInterval 60' /etc/ssh/sshd_config 
    echo 'ClientAliveInterval 60' | sudo tee --append /etc/ssh/sshd_config 
 
    sudo service ssh restart 
 
    # change pw 
    PASSWORD=Arm2019
    echo -e "$PASSWORD\n$PASSWORD\n" | sudo passwd ubuntu 
fi 
 
# Add experimental features to $HOME/.bashrc (if not already there) 
if grep -q "DOCKER_CLI_EXPERIMENTAL" $HOME/.bashrc; then 
    echo "experimental features already set in .bashrc" 
else 
    echo "export DOCKER_CLI_EXPERIMENTAL=enabled" >> $HOME/.bashrc
fi
 

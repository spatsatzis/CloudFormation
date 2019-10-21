#!/bin/bash -xe

cd /home/ec2-user/
mkdir python

if [[ Python36 == *"Node"* ]]; then

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

. ~/.nvm/nvm.sh
nvm install node

npm install --prefix /home/ec2-user/python/ pyOpenSSL

elif [[ Python36 == "Python36" ]]; then

sudo yum install -y python36

pip-3.6 install pyOpenSSL -t /home/ec2-user/python/

elif [[ Python36 == "Python37" ]]; then

sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel xz-devel ncurses-devel gdbm-devel sqlite-devel tk-devel uuid-devel readline-devel zlib-devel

wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz

tar xzf Python-3.7.4.tgz
cd Python-3.7.4

./configure --enable-optimizations
sudo make altinstall

pip3.7 install pyOpenSSL -t /home/ec2-user/python/

else

pip-2.7 install pyOpenSSL -t /home/ec2-user/python/

fi

zip -r layer.zip /home/ec2-user/python/

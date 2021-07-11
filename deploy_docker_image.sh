#!/bin/bash +x

sudo amazon-linux-extras install docker -y

sudo service docker start

sudo usermod -a -G docker ec2-user

sudo chkconfig docker on

sudo yum install git -y 

git clone https://github.com/devendrabobde/basic-flask-app.git

cd /home/ec2-user/basic-flask-app

curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py

python get-pip.py

pip install flask

cat > /home/ec2-user/basic-flask-app/Dockerfile << EOL

FROM python:2.7.18-slim-stretch

WORKDIR /home/ec2-user/basic-flask-app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "routes.py" ]

EOL

sudo docker build --tag flask-app .

sudo docker images -a

sudo docker run -d -p 5000:5000 flask-app

sudo docker ps -a


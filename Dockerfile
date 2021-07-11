
FROM python:2.7.18-slim-stretch

WORKDIR /home/ec2-user/basic-flask-app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "routes.py" ]


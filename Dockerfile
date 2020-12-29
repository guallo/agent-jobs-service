FROM ubuntu
RUN apt-get update

RUN apt-get install -y git python3 python3-pip stunnel4

RUN git clone https://github.com/guallo/agent-jobs-service.git /opt/agent-jobs-service
WORKDIR /opt/agent-jobs-service

RUN pip3 install -r requirements
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

ENTRYPOINT ["/usr/bin/bash", "manage.sh"]

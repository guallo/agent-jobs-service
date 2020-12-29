FROM ubuntu
RUN apt-get update

RUN apt-get install -y git python3 python3-pip

RUN git clone https://github.com/guallo/agent-jobs-service.git /opt/agent-jobs-service
WORKDIR /opt/agent-jobs-service

RUN pip3 install -r requirements

ENTRYPOINT ["/usr/bin/bash", "manage.sh"]

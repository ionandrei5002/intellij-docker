FROM ui-base-docker:latest

ARG username

USER root

RUN apt update && \
    apt install -y maven

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN wget https://download.jetbrains.com/idea/ideaIU-2019.3.3.tar.gz -O /tmp/ideaIU-2019.3.3.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/ideaIU-2019.3.3.tar.gz && \
    mv "/app/`ls /app`" /app/ideaIU

USER $username

CMD ["/bin/bash", "--login", "/app/ideaIU/bin/idea.sh"]

FROM ui-base-docker:latest

RUN wget https://download.jetbrains.com/idea/ideaIU-2019.2.4.tar.gz -O /tmp/ideaIU-2019.2.4.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/ideaIU-2019.2.4.tar.gz && \
    mv "/app/`ls /app`" /app/ideaIU

USER andrei

CMD ["/bin/bash", "--login", "/app/ideaIU/bin/idea.sh"]

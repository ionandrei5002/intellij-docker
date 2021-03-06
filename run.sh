#!/bin/bash

cache="/home/andrei/dockerbuilds/intellij-docker/.cache"
intellij="/home/andrei/dockerbuilds/intellij-docker/.IntelliJIdea2019.3"
java="/home/andrei/dockerbuilds/intellij-docker/.java"
projects="/home/andrei/IdeaProjects"

if [ -d  "$cache" ]
then 
    echo "Directory $cache exists."
else
    mkdir -p $cache
    echo "Directory $cache created."
fi

if [ -d  "$intellij" ]
then 
    echo "Directory $intellij exists."
else
    mkdir -p $intellij
    echo "Directory $intellij created."
fi

if [ -d  "$java" ]
then 
    echo "Directory $java exists."
else
    mkdir -p $java
    echo "Directory $java created."
fi

if [ -d  "$projects" ]
then 
    echo "Directory $projects exists."
else
    mkdir -p $projects
    echo "Directory $projects created."
fi

docker run --rm -d -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $cache:/home/andrei/.cache \
    -v $intellij:/home/andrei/.IntelliJIdea2019.3 \
    -v $java:/home/andrei/.java \
    -v $projects:/home/andrei/IdeaProjects \
    --add-host=mariadb:172.17.0.2 \
    --add-host=mariadb1:172.17.0.3 \
    --env _JAVA_AWT_WM_NONREPARENTING=1 \
    --env AWT_TOOLKIT=MToolkit \
    --name=intellij \
    intellij-docker:latest

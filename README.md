# docker-scm-manager #

Docker container for [SCM-Manager](http://www.scm-manager.org).  
Copy of official [docker image](https://hub.docker.com/r/sdorra/scm-manager/) but running on 80 port.  
Useful for public accessed docker network without ability to publich/redirect ports.  
Use authbind to bind low ports instead of jsvc (have some troubles to launch it).  

## usage ##


```
#!bash

mkdir /var/lib/scm
chown 1000:1000 /var/lib/scm
docker run -v /var/lib/scm:/var/lib/scm  icukeng/scm-manager
```

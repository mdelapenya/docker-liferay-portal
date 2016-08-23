# About this repo
This repository contains some **nonofficial** pet-projects on how to use Liferay with Docker.

# Usage
To start a container from this image please run following command, which will start a Liferay Portal 7 Beta7 instance running on Tomcat 8.0.30, with an embedded HSQL database:
```
docker run -p 9000:8080 mdelapenya/liferay-portal:7-ce-b7-tomcat-hsql
```

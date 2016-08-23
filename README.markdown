# About this repo
This repository contains some **nonofficial** pet-projects on how to use Liferay with Docker.

# Usage
To start a container from this image please run following command, which will start a Liferay Portal 6.1 GA1 instance running on Tomcat 7.0.23, with an embedded HSQL database:
```
docker run -p 9000:8080 mdelapenya/liferay-portal:6.1-ce-ga1-tomcat-hsql
```

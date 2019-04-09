FROM openjdk:8u212-jdk-stretch
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LIFERAY_HOME=/usr/local/liferay-ce-portal-7.0-ga2

RUN mkdir -p "$LIFERAY_HOME"

ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-8.0.32

ENV PATH=$CATALINA_HOME/bin:$PATH

ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/7.0.1%20GA2/liferay-ce-portal-tomcat-7.0-ga2-20160610113014153.zip/download

WORKDIR /usr/local

RUN set -x \
			&& curl -kfSL "$LIFERAY_TOMCAT_URL" -o liferay-portal-tomcat-7.0-ce-ga2-20160610113014153.zip \
			&& unzip liferay-portal-tomcat-7.0-ce-ga2-20160610113014153.zip \
			&& rm liferay-portal-tomcat-7.0-ce-ga2-20160610113014153.zip

COPY ./configs/setenv.sh $CATALINA_HOME/bin/setenv.sh
EXPOSE 8080/tcp
EXPOSE 9000/tcp
EXPOSE 11311/tcp

ENTRYPOINT ["catalina.sh", "run"]

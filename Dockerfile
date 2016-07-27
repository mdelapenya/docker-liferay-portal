FROM java:7
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

RUN apt-get update \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LIFERAY_HOME=/usr/local/liferay-portal-6.2-ce-ga6

RUN mkdir -p "$LIFERAY_HOME"

ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-7.0.62

ENV PATH=$CATALINA_HOME/bin:$PATH

ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.2.5%20GA6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip/download

WORKDIR /usr/local

RUN set -x \
			&& curl -fSL "$LIFERAY_TOMCAT_URL" -o liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip \
			&& unzip liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip \
			&& rm liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip

COPY ./configs/setenv.sh $CATALINA_HOME/bin/setenv.sh

EXPOSE 8080/tcp

ENTRYPOINT ["catalina.sh", "run"]

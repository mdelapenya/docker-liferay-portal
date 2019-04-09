FROM java:6
LABEL maintainer="social.mdelapenya@gmail.com"

RUN apt-get update \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LIFERAY_HOME=/usr/local/liferay-portal-6.1.0-ce-ga1

RUN mkdir -p "$LIFERAY_HOME"

ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-7.0.23

ENV PATH=$CATALINA_HOME/bin:$PATH

ENV LIFERAY_TOMCAT_URL=https://sourceforge.net/projects/lportal/files/Liferay%20Portal/6.1.0%20GA1/liferay-portal-tomcat-6.1.0-ce-ga1-20120106155615760.zip/download

WORKDIR /usr/local

RUN set -x \
			&& curl -kfSL "$LIFERAY_TOMCAT_URL" -o liferay-portal-tomcat-6.1.0-ce-ga1-20120106155615760.zip \
			&& unzip liferay-portal-tomcat-6.1.0-ce-ga1-20120106155615760.zip \
			&& rm liferay-portal-tomcat-6.1.0-ce-ga1-20120106155615760.zip

COPY ./configs/setenv.sh $CATALINA_HOME/bin/setenv.sh

EXPOSE 8080/tcp

ENTRYPOINT ["catalina.sh", "run"]

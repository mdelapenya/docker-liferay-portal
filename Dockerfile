FROM mdelapenya/liferay-portal:7-ce-ga5-tomcat-hsql
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

COPY ./configs/ $LIFERAY_CONFIG_DIR
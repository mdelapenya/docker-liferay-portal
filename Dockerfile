FROM liferay/portal:7.0.1-ga2-tomcat
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

ENTRYPOINT ["catalina.sh", "run"]
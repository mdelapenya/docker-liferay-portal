FROM liferay/portal:7.0.2-ga3-tomcat
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

ENTRYPOINT ["catalina.sh", "run"]

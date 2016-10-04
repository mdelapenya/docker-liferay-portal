FROM mdelapenya/liferay-portal:6.2-ce-ga6-tomcat-hsql
MAINTAINER Manuel de la Peña <manuel.delapenya@liferay.com>

COPY ./configs/portal-ext.properties $LIFERAY_HOME/portal-ext.properties
COPY ./configs/setenv.sh $CATALINA_HOME/bin/setenv.sh
COPY ./configs/ojdbc6.jar $CATALINA_HOME/lib/ext/ojdbc6.jar

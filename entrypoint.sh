#!/bin/bash

set -o errexit

main() {
  show_motd
  prepare_liferay_portal_properties
  prepare_liferay_tomcat_config
  prepare_liferay_deploy_directory
  prepare_liferay_osgi_configs_directory
  run_portal "$@"
}

show_motd() {
  echo "Starting Liferay 7 instance.

  LIFERAY_HOME: $LIFERAY_HOME
  "
}

prepare_liferay_deploy_directory() {
  if [ ! -f $LIFERAY_DEPLOY_DIR/* ]; then
    echo "No deploy files found.
  If you wish to deploy customizations to Liferay make
  sure you include a 'deploy' directory in the root of 
  your project.

  Continuing.
  "
    return 0
  fi

  echo "Deploy directory found.
  The following contents are going to be synchronized
  with Liferay:
  "
  tree $LIFERAY_DEPLOY_DIR

  [ -f $LIFERAY_DEPLOY_DIR/*.lpkg ] && cp $LIFERAY_DEPLOY_DIR/*.lpkg $LIFERAY_HOME/osgi/marketplace
  [ -f $LIFERAY_DEPLOY_DIR/*.jar ] && cp $LIFERAY_DEPLOY_DIR/*.jar $LIFERAY_HOME/osgi/modules
  [ -f $LIFERAY_DEPLOY_DIR/*.war ] && cp $LIFERAY_DEPLOY_DIR/*.war $LIFERAY_HOME/osgi/war
  [ -f $LIFERAY_DEPLOY_DIR/*.xml ] && cp $LIFERAY_DEPLOY_DIR/*.xml $LIFERAY_HOME/deploy

  echo "
  Continuing.
  "
}

prepare_liferay_osgi_configs_directory() {
  if [[ ! -d "$LIFERAY_CONFIG_DIR/osgi" ]]; then
    echo "No 'configs/osgi' directory found.
  If you wish to deploy custom OSGi configurations to
  Liferay make sure you include a 'configs/osgi' directory
  in the root of your project.

  Continuing.
  "
    return 0
  fi

  echo "OSGi configs directory found.
  The following contents are going to be synchronized
  with Liferay:
  "

  tree $LIFERAY_CONFIG_DIR/osgi
  mkdir -p $LIFERAY_HOME/osgi/configs
  cp -r $LIFERAY_CONFIG_DIR/osgi/* $LIFERAY_HOME/osgi/configs 2>/dev/null || true

  echo "
  Continuing.
  "
}

prepare_liferay_portal_properties() {
  if [[ ! -f "$LIFERAY_CONFIG_DIR/portal-ext.properties" ]]; then
    echo "No 'configs/portal-ext.properties' file found.
  If you wish to use a custom properties file make sure
  you include a 'configs/portal-ext.properties' file in the 
  root of your project.

  Continuing.
  "
    return 0
  fi

  echo "Portal properties (portal-ext.properties) file found.
  "

  cp -r $LIFERAY_CONFIG_DIR/portal-ext.properties $LIFERAY_HOME/portal-ext.properties

  sed -i -e "s/web\.server\.protocol=https$/web\.server\.protocol=$LIFERAY_WEB_SERVER_PROTOCOL/g" $LIFERAY_HOME/portal-ext.properties

  echo "
  Continuing.
  "
}

prepare_liferay_tomcat_config() {
  if [[ ! -f "$LIFERAY_CONFIG_DIR/setenv.sh" ]]; then
    echo "No 'configs/setenv.sh' file found.
  If you wish to provide custom tomcat JVM settings, make sure
  you include a 'configs/setenv.sh' file in the 
  root of your project.

  Continuing.
  "
    return 0
  fi

  echo "Tomcat configuration (setenv.sh) file found.
  "

  cp -r $LIFERAY_CONFIG_DIR/setenv.sh $CATALINA_HOME/bin/setenv.sh

  echo "
  Continuing.
  "
}

run_portal() {

  set -e

  # Drop root privileges if we are running liferay
  # allow the container to be started with `--user`
  if [ "$1" = 'catalina.sh' -a "$(id -u)" = '0' ]; then
    # Change the ownership of Liferay Shared Volume to liferay

    if [[ ! -d "$LIFERAY_SHARED" ]]; then
      mkdir -p $LIFERAY_SHARED
    fi

    chown -R liferay:liferay $LIFERAY_SHARED
    chown -R liferay:liferay $LIFERAY_HOME
    
    set -- gosu liferay "$@"
  fi

  # As argument is not related to liferay,
  # then assume that user wants to run his own process,
  # for example a `bash` shell to explore this image
  exec "$@"
}

main "$@"
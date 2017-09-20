#!/bin/bash

set -o errexit

main() {
  show_motd
  prepare_liferay_portal_properties
  prepare_liferay_deploy_directory
  prepare_liferay_osgi_configs_directory
  run_portal
}

show_motd() {
  echo "Starting Liferay 7 instance.

  LIFERAY_HOME: $LIFERAY_HOME
  "
}

prepare_liferay_deploy_directory() {
  if [ ! -f $DEPLOY_DIR/* ]; then
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

  tree $DEPLOY_DIR
  mkdir -p $LIFERAY_HOME/deploy
  cp -r $DEPLOY_DIR/* $LIFERAY_HOME/deploy

  echo "
  Continuing.
  "
}

prepare_liferay_osgi_configs_directory() {
  if [[ ! -d "$CONFIG_DIR/osgi" ]]; then
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

  tree $CONFIG_DIR/osgi
  mkdir -p $LIFERAY_HOME/osgi/configs
  cp -r $CONFIG_DIR/osgi/* $LIFERAY_HOME/osgi/configs 2>/dev/null || true

  echo "
  Continuing.
  "
}

prepare_liferay_portal_properties() {
  if [[ ! -f "$CONFIG_DIR/portal-ext.properties" ]]; then
    echo "No 'portal-ext.properties' file found.
  If you wish to use a custom properties file make sure
  you include a 'portal-ext.properties' file in the 
  root of your project.

  Continuing.
  "
    return 0
  fi

  echo "Portal properties (portal-ext.properties) file found.
  "

  cp -r $CONFIG_DIR/portal-ext.properties $LIFERAY_HOME/portal-ext.properties

  echo "
  Continuing.
  "
}

run_portal() {
  exec catalina.sh run
}

main "$@"
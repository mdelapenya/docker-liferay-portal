# About this repo
This repository contains some **nonofficial** pet-projects on how to use Liferay with Docker.

# Available Liferay Releases
  - Liferay 7.1 RC 1
  - Liferay 7.1 Beta 3
  - Liferay 7.1 Beta 2
  - Liferay 7.1 Beta 1
  - Liferay 7.1 Alpha 2
  - Liferay 7.1 Milestone 1
  - Liferay 7.0.5 GA6
  - Liferay 7.0.4 GA5
  - Liferay 7.0.3 GA4
  - Liferay 7.0.2 GA3
  - Liferay 7.0.1 GA2
  - Liferay 7.0.0 GA1
  - Liferay 7.0.0 Beta8
  - Liferay 7.0.0 Beta7
  - Liferay 6.2.0 GA6

# Environment variables

### DEBUG_MODE

This variable is optional and allows you to specify if the container is run using a debug configuration. In the case of Tomcat, port 9000 will be exposed for debugging the application server.

### JVM_TUNING_MEMORY

This variable is optional and allows you to specify the Xmx and Xms JVM memory configuration. If no variable is passed, then 2048m will be used as default value.

# Customized Environment support
There are some different image configurations supported under this repository, depending on if you want to use Liferay Portal with a different database or application server.

If you are using any of the CE supported databases (**MySQL or PostgreSQL**), please **use the right Git branches** on this repository to check out the docker-compose files for each database, which will provide an additional Docker container with the supported database, linked to the container running Liferay Portal. Besides, this `README.md` file will change and describe the usage for each branch.

## Supported Databases
These are the supported Database Management System (*DBMS*):
  - HSQL
  - MySQL
  - PostgreSQL

## Supported Application Servers
These are the supported App servers:
  - Tomcat

## Branch name convention
Since Liferay Portal 7.1, I won't support any other configuration than the default, which is Tomcat + HSQL. For that reason, the convention for branch names, using `-` as separator, is:
  - Liferay major version: `7.1`
  - Liferay community edition: `ce`
  - Liferay release: `beta3`

So, if you are using Liferay 7.1 Beta3, you should use the `7-ce-beta3` branch.

The git branch is named using the same convention, i.e.:

  https://github.com/mdelapenya/docker-liferay-portal/tree/7.1-ce-beta3

For previous releases, the convention for branch names, using `-` as separator, was:
  - Liferay major version: `7`
  - Liferay community edition: `ce`
  - Liferay release: `ga5`
  - Application server: `tomcat`
  - DBMS: `hsql`

So, if you are using Liferay 7 GA5 with MySQL or PostgreSQL, you should use the `7-ce-ga5-tomcat-mysql` or `7-ce-ga5-tomcat-postgres` branches, respectively.

The git branches are named using the same convention, i.e.:

  https://github.com/mdelapenya/docker-liferay-portal/tree/7-ce-ga5-tomcat-hsql
  https://github.com/mdelapenya/docker-liferay-portal/tree/7-ce-ga5-tomcat-mysql
  https://github.com/mdelapenya/docker-liferay-portal/tree/7-ce-ga5-tomcat-postgres

# License
These docker images are free software ("Licensed Software"); you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

These docker images are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; including but not limited to, the implied warranty of MERCHANTABILITY, NONINFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

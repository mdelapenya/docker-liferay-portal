# About this repo
This repository contains some **nonofficial** pet-projects on how to use Liferay with Docker.

# Available Liferay Releases
  - Liferay 7.1.2 GA3
  - Liferay 7.1.1 GA2
  - Liferay 7.1.0 GA1
  - Liferay 7.1 RC 1
  - Liferay 7.1 Betas (1, 2, and 3)
  - Liferay 7.1 Alpha 2
  - Liferay 7.1 Milestone 1
  - Liferay 7.0 GAs (GA1, GA2, GA3, GA4, GA5, GA6 and GA7)
  - Liferay 7.0.0 Betas (7 and 8)
  - Liferay 6.2.0 GA6
  - Liferay 6.1.3 GA3

# Environment variables

### DEBUG_MODE

This variable is optional and allows you to specify if the container is run using a debug configuration. In the case of Tomcat, port 9000 will be exposed for debugging the application server.

### LIFERAY_JVM_OPTS

This variable is optional and allows you to specify any value to the JAVA_OPTS, which will be appended to the existint Tomcat JAVA_OPTS. If no variable is passed, then an empty string will be appended.

# Customized Environment support
We have removed the database support from this repo, which means pruning all old branches with code related to databases. For that reason, we will only maintain the base image so you could extend it very easily using, i.e., Docker Compose.

## Supported Application Servers
These are the supported App servers:
  - Tomcat

## Branch name convention
Since Liferay Portal 7.1, I won't support any other configuration than the default, which is Tomcat + HSQL. For that reason, the convention for branch names, using `-` as separator, is:
  - Liferay major version: `7.1`
  - Liferay release: `beta3, ga1, ga2...`

So, if you are using Liferay 7.1 Beta3, you should use the `7.1-beta3` branch.

The git branch is named using the same convention, i.e.:

  https://github.com/mdelapenya/docker-liferay-portal/tree/7.1-beta3

For previous releases, I've removed the support in this repo for any database, which in the end is a matter of using docker compose for spinning up a database, and configuring the portal to connect to it. For this reason I want to keep this repo as simple as possible.

# License
These docker images are free software ("Licensed Software"); you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

These docker images are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; including but not limited to, the implied warranty of MERCHANTABILITY, NONINFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

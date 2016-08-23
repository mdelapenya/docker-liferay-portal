# About this repo
This repository contains some **nonofficial** pet-projects on how to use Liferay with Docker.

# Usage
To start a container from this image please run following command, which will start a Liferay Portal 7 GA1 instance running on Tomcat 8.0.32, with an embedded HSQL database:
```
docker run -p 9000:8080 mdelapenya/liferay-portal:7-ce-ga1-tomcat-hsql
```

# License
These docker images are free software ("Licensed Software"); you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

These docker images are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; including but not limited to, the implied warranty of MERCHANTABILITY, NONINFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

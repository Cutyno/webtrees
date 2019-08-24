# ![webtrees - online collaborative genealogy](https://www.webtrees.net/templates/webtrees/images/webtrees.jpg) dockerized server

dockerized https://github.com/fisharebest/webtrees

[![DockerHub Badge](https://dockeri.co/image/cutyno/webtrees)](https://hub.docker.com/r/cutyno/webtrees)
[![DockerHub Badge](https://dockeri.co/image/cutyno/webtrees-database)](https://hub.docker.com/r/cutyno/webtrees-database/)

## Installation
* download from https://github.com/Cutyno/app-webtrees
  * e.g. wget https://github.com/Cutyno/app-webtrees/archive/master.zip; unzip master.zip; rm master.zip
  * cd app-webtrees-master
* run **sudo ./install.sh -f  /yourpath/without/slash/at/the/end  -p  portnumber"**
  * -f path to your data folder 
  * -p free port for the webtrees container
* run **docker-compose  up  -d** 
* open http://localhost:10080/webtrees/ in your browser (change the port, as specified in install.sh)
* initial user/password: **admin** / **changethepassword**

## Docker Images Used
 * [cutyno/webtrees](https://hub.docker.com/r/cutyno/webtrees/) webtrees container 
 * [cutyno/webtrees-database](https://hub.docker.com/r/cutyno/webtrees-database/) preconfigured database container, or the offical mySQL container [mySQL](https://hub.docker.com/_/mysql/)
 * [busybox](https://hub.docker.com/_/busybox/), offical data container
 
## Install Environment Variables
  * MYSQL_ROOT_PASSWORD = password, only used within the docker container
  * MYSQL_DATABASE = name of the mysql database, typical *webtrees*. The DB file is stored in the mounted volume
  * MYSQL_USER = name of the mysql user, typical *webtrees*
  * MYSQL_PASSWORD = mysql user password, only used within the docker container

## Mounted Volumes

* the mysql datafolder _/var/mysql_ will be mounted to _/yourlocalpath/webtrees/var/mysql_ 
* the webtrees datafolder _/var/www/html/webtrees/data_ will be mounted to _/yourlocalpath/webtrees/var/www/html/webtrees/data_ 


## Installation Instructions 

#### Run install.sh 

```
$sudo ./install.sh -f  /yourpath/without/slash/at/the/end  -p  portnumber
```

install.sh generates a local volume on your machine and copies the initial config for webtrees to ...var/www/html/webtrees/data. 

In the second step the script will generate out of docker-compose-template.yml the docker-compose.yml.

The mysql container is initialzed with a default user for the webtrees appilcation. 

#### Startup the docker containers 
```
$ docker-compose up -d
$ docker ps 
```


#### Start the application

* http://localhost:portnumber/webtrees/ (change the port as configured in install.sh)
* login with 
  * user: __admin__
  * password: __changethepassword__
 * change the admin password, create users, etc.
   * https://wiki.webtrees.net/en/Administration_pages#Users
   * https://wiki.webtrees.net/en/Novice_User_Guide

## License

* **webtrees: online genealogy**
* Copyright 2019 webtrees development team

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
   
## Special thanks

special thanks to Heimo Müller for the base repository. Please check it out [lomadi/app-webtrees](https://github.com/lomadi/app-webtrees)

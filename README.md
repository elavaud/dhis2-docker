# DHIS2  

This project is a fork from the official DHIS2 docker. It is however using alpine images and added services (backups/restore, nginx reverse proxy). It comes with a fresh / empty database.  

### Requirements  

Git, Docker and Docker-compose (here v3.3)  

### Installation  
*Explanations using Debian systems*  

Clone this repository in the location of your choice and enter into it.    
```
git clone https://github.com/elavaud/dhis2-docker.git
cd dhis2-docker
```

If you do not want use some of the services of this docker compose, edit the docker-compose.yml and comment out the services not desired.  

According to the services chosen, copy the corresponding environment files into the root directory and provide your environment variables. Below is an example for the PostgreSQL service.  
```
cp env_templates/template.postgres.env .postgres.env
vi .postgres.env
```

If you have a specific version of the DHIS2 application you would like to use, copy it into the "dhis2app" folder and name it "dhis.war". If not, the last version of DHIS2 will be automatically downloaded.

### Start  

Launch DHIS2 with the following command
```
docker-compose up -d
```

Once the DHIS2 application is started, you are able to access it by opening your browser and going to http://IP (if on your own computer: http://localhost).

A system.d service would use this command for launching DHIS2 at startup.  

The application can then be stopped using:  
```
docker-compose down
```

### Services

This compose include the 5 following services:
* [Rabbit MQ:](https://hub.docker.com/_/rabbitmq/) Version 3, alpine. RabbitMQ is open source message broker software (sometimes called message-oriented middleware) that implements the Advanced Message Queuing Protocol (AMQP).
* [PostgreSQL with PostGIS:](https://hub.docker.com/r/mdillon/postgis/) MDillon version of PostgreSQL including PostGIS. Version 10, alpine. A volume is created in the compose for persitent data.
* DHIS2: The main DHIS2 application. The only being build here. Its logs and the tomcat logs are stored in the "logs" folder in the root of this repository.
* [backNcrypt:](https://hub.docker.com/r/elavaud/backncrypt/) Version 1, alpine. Backup, encrypt and restore SQL dumps using 3 levels backups. See the link for understanding its environment variables.
* [Nginx:](https://hub.docker.com/r/_/nginx/) Version 1.13 alpine. Proxy server here used as a reverse proxy for the tomcat application.

### Useful links  

In addition to the above links, the following ones could be useful:  
* [DHIS2:](https://www.dhis2.org/) Main DHIS2 website.
* [pgracio dhis2 compose:](https://github.com/pgracio/dhis2-docker) Although this project is a fork from the official DHIS2 docker, this DHIS2 Docker repository helped me a lot in building this one.  

### Known caveats  

Tomcat is not well configured and takes quite a bit of time to startup (~ 90 seconds)

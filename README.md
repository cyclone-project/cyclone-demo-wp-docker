CYCLONE Federated Identity Wordpress Demo with Docker
=====================================================
This is a demonstration for the integration of a widely used application, in this case Wordpress, with the Federated Identity Provider of the project CYCLONE. It allows cloud application users to deploy a Wordpress instance as a Service on Docker compatible clouds and log in using their eduGAIN identities via CYCLONE's Keycloak instance. It consists of a preconfigured Wordpress instance with the Generic Open Id Connect Plugin and an installation script for customized images to configure Wordpress by updating its tables at runtime. [The Generic OpenID Connect Plugin](https://wordpress.org/plugins/generic-openid-connect/) implements the Open ID Connect Authorization Code Flow. 
 
Usage
-----
To start a container with defaults, on the project root run:
``` 
docker-compose build
docker-compose up -d 
```

When cloud application users send a request to wordpress-site-url/wp.login.php, they are redirected to the Keycloak Federated Identity Provider. They can select the identity provider of their choice and log in. Keycloak returns the token to the Wordpress instance and the Generic Open Id Connect Plugin creates a Wordpress user for the eduGAIN identity.

Details
-------
To build the image, install the latest version of Docker and Docker Compose [1]. This image was tested with Docker 1.8.3 and Docker-Compose 1.4.2 on Ubuntu Trusty.

The Wordpress configuration can be made in two steps by editing: 

1. the docker compose configuration file
  - docker-compose.yml if no external data volume is needed
  - docker-compose.yml to be able to edit the container's files outside the container

2. the components/wordpress/wp-cli.yml file

The configuration for the wordpress build in the docker-compose.yml must be consistent with the wp-cli.yml file:

```
wordpress:
  build: components/wordpress
  environment:
    - WORDPRESS_DB_PASSWORD=tastamam
  links:
    - wordpressdb:mysql
  ports:
    - "80:80"
```

Docker Compose's syntax for the ports is HOST:CONTAINER, this means that Wordpress will run on port 80 on the container and can be accessed on the host machine on port 80 as well. The environment variable WORDPRESS_DB_PASSWORD must be the same as MYSQL_ROOT_PASSWORD, since root is the default user for the MySQL database. 
Same values for the database and the port should be configured in wp-cli.yml. This file is used by the [wp-cli](http://wp-cli.org/) command line Wordpress management tool to be able to connect to Wordpress' database to install the OpenId Connect Plugin and add its configuration. For example:

```
wordpress:
  ports:
    - "80:80"
```    
requires

` url: "http://localhost" `

[1]: https://docs.docker.com/compose/install/ "Installation Docker and Docker Compose"

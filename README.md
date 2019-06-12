# Building-the-First-Version-of-the-Bangazon-Site - Tutshill Tornados

This is the first iteration of the Bangazon Ruby on Rails Website

## Software Versions

```
Ruby 2.4.2
Rails 5.1.4
mysql  Ver 14.14
```

## Get Started
To get started, navigate to the directory of your choice and run the following code in the command line
```
git clone https://github.com/TutshillTornados/Building-the-First-Version-of-the-Bangazon-Site.git
cd Building-the-First-Version-of-the-Bangazon-Site
```
## Install

* Configuration
### Setup MySql
1. download mysql instructuction
1. set up mysql acct
1. set up database
### Install PaperClip Support
1. `brew install imagemagick`
### Install Gems
1. `bundle install`
* Database creation
* [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Install Rails](https://github.com/tbsvttr/install-ruby-and-rails)
* [Install MySQL](https://www.mysql.com/downloads/) or install with homebrew

```
brew update
brew install mysql
```
After mySQL installs, run the following command:
```
mysql_secure_installation
```
You will be prompted to answer a series of questions (recommended answers: n, y, y, y, y)

**NOTE:** If you recieve the following error...
```
Error: Can’t connect to local MySQL server through socket ‘/tmp/mysql.sock’ (2)
```
Stop the mySQL Sever and restart it using the following commands:
START
```
mysql.server start
```
## Setup Database
In consle, run the following code to setup the database
```
mysql -u root -p
```
Enter the password you created when you setup mysql

Now, you will be inside the mySQL CLI. You should see something similar to the following:
```
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 5
Server version: 5.7.20 Homebrew

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```
Create the Development DB
```
CREATE DATABASE Bangazon_Site_development;
```
Create the Testing DB
```
CREATE DATABASE Bangazon_Site_test;
```
Grant privileges to development DB by setting a user and a password. User: tornados_user PW: ruby
```
GRANT ALL PRIVILEGES ON Bangazon_Site_development.* TO 'tornados_user'@'localhost' IDENTIFIED BY 'Tornados$1';
```
Grant privileges to testing DB by setting a user and a password. User: tornados_user PW: ruby
```
GRANT ALL PRIVILEGES ON Bangazon_Site_test.* TO 'tornados_user'@'localhost' IDENTIFIED BY 'Tornados$1';
```
Exit the mySQL CLI
```
exit
```

## Initialize App

run commands in console
``` 
bundle install
rails g simple_form:install --bootstrap
rails db:migrate
rails db:seed
rails s
```
Visit localhost:3000 in web browser for Rails page

## Meet the Dev Team
- [Austin Kurtis](https://github.com/austinKurtis)
- [Teresa Vasquez] (https://github.com/drteresavasquez)
- [Daniel Greene](https://github.com/danielgreene101)
- [Matt Minner](https://github.com/Mminner4248)
- [Eric Palmieri](https://github.com/palmierie)

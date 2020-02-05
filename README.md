# MarDom (practical evaluation)

This project is a practical assessment of database knowledge, programming languages, separation of concepts, good practices, good validations and graphic interface.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Node.js version 12.14.1 LTS available on the following website: https://nodejs.org/en/

Dotnet Core 3.1 available on the following website: https://dotnet.microsoft.com/download/dotnet-core/3.1

Visual Studio Code or Visual Studio available on the following website: https://visualstudio.microsoft.com/es/downloads/

SQL SERVER  available on the following website: https://www.microsoft.com/es-es/sql-server/sql-server-downloads


### Installing

If using Visual Studio Code just open de console in the main folder of the proyect and type: "code ." and the project will be opened.
If using Visual Studio open the file MarDom.csproj.

1)Open a new console and type: "dotnet restore" and then "dotnet build".
2)type "cd ClientApp" to navigate to client folder.
3)In the console type: "npm install" to get all Node dependencies.
4)then type: "cd .." to go back the main folder.


### Database connection settings

On an SQL server, run the script "Mardom.sql" to generate the database with the tables and initial data.

1)Open appsettings.json file to edit database connection settings. 
2)on line 10 is the connection to the MarDom database. Replace the name of the server, user and password with the name of the server and the credentials of the user where the database is located.
3)Save the file.

### Run the project

Open a console in the main folder and type:
1)"dotnet restore",
2)"dotnet build"
3) and then "dotnet run" to run the project in release mode.

To run in debug mode click in "Start debugging".

### Login

For testing reasons, 2 users have been created in the database which can be accessed in the system. These users are:
User: wandyrh@mardom.com 
Password: Password01

User: admin@mardom.com
Password: Password01

Once logged into the system, the user can navigate in the different menus for inventory management.

### Deployment

Open a console in the main folder and type:
"dotnet restore",
"dotnet build",
and then "dotnet publish".

When finish, go to \bin\Release\MarDom\win-x64\publish. The publish folder contain the files to deploy the project.

## Built With

* [Dotnet Core 3.1](http://www.dropwizard.io/1.0.2/docs/) - Backend API.
* [Node.js version 12.14.1 LTS](https://nodejs.org/en/) - JavaScript runtime
* [Angular](https://angular.io/docs) - Javascript framework.
* [Boostrap 3.3](https://getbootstrap.com/docs/3.3/) - For CCS styles library.
* [SQL SERVER](https://www.microsoft.com/es-es/sql-server/sql-server-downloads) - Data Base.

## Authors

* **Wandy Rodríguez** - *Initial work* - [inventory-management](https://github.com/Wandyrh/AngularCore3.1-inventory-management)






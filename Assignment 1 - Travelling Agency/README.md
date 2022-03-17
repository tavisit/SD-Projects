![UTCN](https://doctorat.utcluj.ro/images/utcn-logo.png)
## Student: Octavian-Mihai Matei
## Group: 30431

# Travelling Agency

# Table of contents

* [Subject specification](#specifications)
* [Use Cases](#use-cases)
* [Database](#database)
* [Class Diagram](#class-diagram)
* [Conclusions](#conclusions)

# QR Code
![image](https://user-images.githubusercontent.com/28965189/158731091-0f0df726-d393-4eed-9199-99e95e1b9d1b.png)

# Specifications

The goal of this project is to design and implementation of a vacation seeking application having the following criteria:
Now, the application needs to accommodate only 2 types of users (lucky you):
* Regular User/Vacay seeker
* Travelling Agency

The Travelling Agency should be able to:

1. add vacation destination
2. add vacation packages for a specific destination
a. should contain information: name, price, period, extra details, number
of people that can book the vacation
3. edit an existing vacation package
4. delete an existing vacation package
5. view all its listed vacation packages (with status: BOOKED, NOT_BOOKED,
IN_PROGRESS)
6. delete vacation destination

The Regular User should be able to:

1. register on the platform using some credentials (username/email - unique &
password)
2. login on the platform
3. view all available vacation packages
4. filter vacation packages by destination/price/period
5. book a vacation
6. view all its booked vacations

# Use cases

The project has two main users: normal user, who books packages, and the agency account, which creates and manages packages

## Use-case Identification

Use case name: Create vacation package
Level: An agency will create a package
Main actor: Agency
Main success scenario: 
First, they will login, select the desired location, fill in the information required and execute the addition.

Use case name: Delete location
Level: An agency will delete a location
Main actor: Agency
Main success scenario: 
First, they will login, select the desired location from a drop down menu and press the delete location. This action should also delete all the aparitions of the said location from database and all the packages that include this location

Use case name: Book package
Level: A client will book a package
Main actor: Client
Main success scenario: 
First, they will login, select the desired filters. After this step, the client should only see the desired information and after selecting the package, they should press a submit button. Following, the user should see the package in the already booked section.

## UML Use-Case Diagram

![image](https://raw.githubusercontent.com/tavisit/SD-Projects/Agency_Project/Assignment%201%20-%20Travelling%20Agency/Documentation%20Diagrams/Agency%20User%20use%20case.drawio.png)
![image](https://raw.githubusercontent.com/tavisit/SD-Projects/Agency_Project/Assignment%201%20-%20Travelling%20Agency/Documentation%20Diagrams/Normal%20User%20use%20case.drawio.png)
# Database

The application contains four databases that interact with eachother, in order to provide cascading features in case of creation/modification/delete operations

![image](https://raw.githubusercontent.com/tavisit/SD-Projects/Agency_Project/Assignment%201%20-%20Travelling%20Agency/Documentation%20Diagrams/databaseDiagram.png)
# Class Diagram

# Conclusions

The application taught me how to build a layered application using databases. In the same time, it taught me how to respect stakeholder's criteria and how to manage my time

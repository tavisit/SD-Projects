# Food Panda 2.0

![UTCN](https://doctorat.utcluj.ro/images/utcn-logo.png)
## Student Octavian-Mihai Matei
### Group 30431

<div style="page-break-after: always;"></div>

**Table of contents**
* [Project specification](#project-specification)
* [Use Case model](#use-case-model)
  - [The Restaurant Administrator](#the-restaurant-administrator-should-be-able-to-)
  - [The Buyer](#the-buyer-should-be-able-to-)
  - [Users and stakeholders](#users-and-stakeholders)
  - [User Case Diagram](#user-case-diagram)
* [E-R Diagram](#e-r-diagram)
* [Class Diagram](#class-diagram)
  
<div style="page-break-after: always;"></div>

## Project specification

Implement a delivery service that can incorporate 2 roles: **buyer** and **restaurant administrator**.
The customer should be able to order food and see the available options, while the administrator
should be able to create new instances of foods and restaurants.

## Use Case model

There are two types of users which can access and use the application such as :
**restaurant administrator** and **buyer**.

#### The Restaurant Administrator should be able to:

* log-in to the application
* add restaurant to the application ( information needed: name, location, available delivery zones)
* select category and add foods for each category
* view menu (with all existing foods, separated into categories)
* accept/decline order
* view orders (with status)
* filter orders by status
* change status of order (in order)

#### The Buyer should be able to:

* register into the application
* log-in into the application
* view restaurants
* view menu for the selected restaurant
* add foods to cart
* place order
* see status of the order
* see history of all orders placed
* search the restaurants by name

<div style="page-break-after: always;"></div>

#### Users and stakeholders

**Users**
* Restaurant Administrator
* Buyers
**Stakeholders**
* Development team
* Quality Assurence
* Product Owner
* Project Manager
* FoodPanda

<div style="page-break-after: always;"></div>

#### Use-Case Diagram

![Use Case Diagram](https://github.com/tavisit/SD-Projects/blob/FoodPanda_Project/FoodPanda_Project/images/usecase.png?raw=true)

<div style="page-break-after: always;"></div>

## E-R Diagram

![E-R Diagram](https://github.com/tavisit/SD-Projects/blob/FoodPanda_Project/FoodPanda_Project/images/er.png?raw=true)

<div style="page-break-after: always;"></div>

## Class Diagram

![Package Diagram](https://github.com/tavisit/SD-Projects/blob/FoodPanda_Project/FoodPanda_Project/images/package.png?raw=true)

![Class Diagram](https://github.com/tavisit/SD-Projects/blob/FoodPanda_Project/FoodPanda_Project/images/class.png?raw=true)


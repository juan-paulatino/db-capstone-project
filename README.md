# Database Engineer Capstone by Meta
The Capstone project enables you to demonstrate multiple skills from the Certificate by solving an authentic real-world problem. In this course, you will demonstrate your new skillset by designing and composing a database solution, combining all the skills and technologies you've learned throughout this program to solve the problem at hand.

By the end of this project, you’ll have proven your ability to:
-Set up a database project,
-Add sales reports,
-Create a table booking system,
-Work with data analytics and visualization,
-And create a database client.

You’ll also demonstrate your ability with the following tools and software:
-GitHub,
-MySQL Workbench,
-Tableau,
-And Python.

## Little Lemon DB-capstone-project
### About the Project
### Project info
This module provides practical hands on experience with using MySQL. Set up a MySQL instance server in MySQL Workbench, then create an ER Diagram data model and implement it in MySQL. Use SQL to create virtual tables, stored procedures and prepared statements for Little Lemon restaurant. Visualize the sales data of a restaurant and implement a database client in Python.

# Data Modeling
To well-design the database, we start with the Entity Relationship Diagram(ER Diagram). This methodology requires dividing the information in the dataset into entities, and defining the relationship between them.

The dataset contains the following entities:

1. Customer
2. Bookings
3. Order
4. Order Delivery
5. Staff
6. Menu
7. Menu Items

Let's start the three-level modeling.

1. Conceptual Data Model:

  The 3 basic components of Conceptual Data Model are:
  - Entity: A real world thing
  - Attribute: Characteristics or properties of an entity
  - Relationship: Dependency or association between two entities

2. Logical Data Model:

3. Physical Data Model:
   Physical Data Model describes a database-specific implementation of the database model. It contains information about the database columns, keys, constraints, and other RDBMS (Relational Database Management System) features.
   
![githubphysical](https://github.com/juan-paulatino/db-capstone-project/assets/118320209/425cc4af-09ed-48d7-9562-b4bdfc19aa88)


# Database Model Implementation on MySQL Workbench
1. ER-Diagram of the Data Model
   The implementation of the ER-Diagram (Entity Relationship Diagram) of the database on MySQL Workbench.

<img width="837" alt="buenotas4" src="https://github.com/juan-paulatino/db-capstone-project/assets/118320209/12259214-18b7-42a4-a832-e81da86bbf1c">


2. Database implementation using Forward Engineer tool
  This tool generates a SQL script which creates the database with its tables, columns and constraints from its ERD, and runs this script to have the database ready in MySQL Server.

This is a part from the code that was generated using Forward Engineer tool: 

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_super_store` DEFAULT CHARACTER SET utf8 ;
USE `global_super_store` ;

-- -----------------------------------------------------
-- Table `global_super_store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Customers` (
  `CustomerID` VARCHAR(100) NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `Segment` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;

# Building a Dimensional Data Model for Little Lemon restaurant











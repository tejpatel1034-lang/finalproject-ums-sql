# University Course Management System (SQL)

## Overview

This project is a complete SQL-based implementation of a University Course Management System. It demonstrates practical usage of core and advanced SQL concepts through structured database design and query execution.

The system manages students, courses, instructors, enrollments, and departments, allowing efficient data handling and analysis.

## Features

* Full database creation with relational tables
* Implementation of Primary Key and Foreign Key constraints
* CRUD operations (Create, Read, Update, Delete)
* Data retrieval using filtering and sorting
* INNER JOIN and LEFT JOIN operations
* Subqueries for advanced data filtering
* Aggregate functions such as COUNT, AVG, MAX
* Window function for running totals
* String and date manipulation functions
* CASE expression for conditional classification

## Technologies Used

* SQL (MySQL)

## Database Structure

The system consists of the following tables:

* students
* departments
* courses
* instructors
* enrollments

Each table is properly normalized and linked using foreign key relationships.

## Key SQL Operations Implemented

* Creating database and tables
* Inserting structured sample data
* Updating and deleting records
* Joining multiple tables for meaningful insights
* Performing aggregations and grouping
* Using subqueries for nested logic
* Applying window functions
* Using CASE statements for labeling data

## How to Run the Project

1. Open MySQL Workbench or any SQL editor (such as VS Code)
2. Create a new database
3. Copy and execute the SQL script file `final_ums.sql`
4. Run queries step by step to view outputs

## Sample Functionalities

* Retrieve students enrolled after a specific year
* Find courses offered by a specific department
* Count students enrolled in each course
* Identify students enrolled in multiple courses
* Calculate average course credits
* Find highest salary in a department
* Generate running totals of enrollments
* Classify students as Senior or Junior

## Project Structure

             university-course-management-sql/
                          │
                          ├── ums.sql
                          └── README.md

## sample_output/students_after_2022  
           studentid | firstname | lastname | enrollmentdate
           -------------------------------------------------
           3         | tej       | patel    | 2023-07-01
           4         | diya      | patel    | 2023-08-14
           6         | vandita   | patel    | 2024-01-10
           9         | reni      | patel    | 2023-01-10
           13        | anita     | patel    | 2023-09-09

## join_output
           firstname | coursename
           ----------------------
          john      | sql
          john      | data structures
          jane      | sql
          jane      | data structures
          tej       | sql
          tej       | data structures

  ## students_firstname_lastname
           studentid | firstname | lastname
           --------------------------------
           1         | john      | doe
           2         | jane      | smith
           3         | tej       | patel
           6         | vandita   | patel
           7         | dhruvi    | patel
           8         | pooja     | patel
           9         | reni      | patel
           10        | gresi     | patel
           11        | meet      | patel
           12        | jeeny     | patel
                          
## Author

Tej Patel


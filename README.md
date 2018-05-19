# README

- Create a rails application with mysql or psql database

- The application has two models: User and Tasks

- Each User has the columns which he needs to log in (Mail, PasswordHash, ...)

- Each Task has an Start, End and Description

- Each User can have multiple Tasks but every Task is assigned to a single User

- Model validations that make sure that each Task has a Description present and Start is before the End
- User validations that make sure Mail Address is valid and Password present
- Add tests for these models
- Add controller tests

# BNB-Group-Challenge
```
Headline specifications:
Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for users to book that space.
Until a user has confirmed a booking request, that space can still be booked for that night.
```

```
User Stories:

User Story 1:
As a User
So I can use makers BNB
I need to create an account


User Story 2:
As a user
So I can list a space
I need to name the space


User Story 3:
As a user
So I can advertise my space
I need to add a description of it

User Story 4
As a user
So I can make money
I need to add the price of the space
```
------
### To set up the database

Connect to `psql` and create the `makersbnb` database:
```
CREATE DATABASE makersbnb;
```
To set up the tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder.

### To set up Testing database
Connect to `psql` and create the `makersbnb_test` database:
```
CREATE DATABASE makersbnb_test;
```
To set up the tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder.

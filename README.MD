# Bookmark Manager

## Introduction

This is a bookmark management system, designed to collate and organise bookmarks for a range of users. This readme will be updated with appropriate information as production progresses.

## User Stories

User Story 1:

As a user
So that I want to be able to view previous websites I've bookmarked
I want to be able to see a list of bookmarks

User Story 2:

As a user
So that I want to be able to view a website I've just visited again
I want to be able to add a bookmark to a list of bookmarks

User Story 3:

As a user
So that I keep my bookmark list tidy
I want to be able to delete any bookmarks from a list of bookmarks

## To set up the database

Connect to `psql` and create the `bookmark_manager` database:
 ```
CREATE DATABASE bookmark_manager;
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```
 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

You will need to create a database for the test environment as well, in order to run all the tests.
```
CREATE DATABASE bookmark_manager_test;
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```

 ##

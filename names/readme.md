
### Setting up Active Reord with Sinartra

This app is going to store Names

Steps
- Set up the directory - sinatra new names -va
- Set up Database
    - In psql, create database names_db;
    - CREATE TABLE names (
        id SERIAL4 PRIMARY KEY,
        name VARCHAR(200)
      );
    - CREATE TABLE users (
      id SERIAL4 PRIMARY KEY,
      email VARCHAR(200),
      password VARCHAR(200)
    );
    - Add data
        - INSERT INTO names_db (name) VALUES ('Darryl');
        - INSERT INTO users (email) VALUES ('darryl@iinet.net.au');
- Set up the models rb files
    -   class Name < ActiveRecord::Base
        end
    -   class User < ActiveRecord::Base
        end
    - NB.... class is singular of table
- Set up app_console.rb
- Set up db_config.rb
- Add enable :sessions at the top of the main.rb

- Add Routes and ERB

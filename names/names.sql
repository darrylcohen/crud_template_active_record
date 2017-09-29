CREATE DATABASE names;

CREATE TABLE names (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200)
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(200),
  password VARCHAR(200)
);

INSERT INTO names (name) VALUES ('Darryl');

INSERT INTO users (email) VALUES ('darryl@iinet.net.au');

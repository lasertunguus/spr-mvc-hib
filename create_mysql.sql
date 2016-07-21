DROP DATABASE IF EXISTS hibnatedb; 
CREATE DATABASE hibnatedb; 
USE hibnatedb;
DROP USER ‘hibuser’@‘localhost’;
CREATE USER 'hibuser'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON hibnatedb.* TO 'hibuser'@'localhost';
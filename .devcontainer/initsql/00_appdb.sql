CREATE USER appdb password 'appdb' login;
CREATE DATABASE appdb owner appdb;
GRANT ALL PRIVILEGES ON DATABASE appdb TO appdb;

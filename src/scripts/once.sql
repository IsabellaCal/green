-- this script should run on postgres
--
-- psql -U postgres \i setup.sql

drop schema if exists green cascade;
drop user if exists green;

create user green with password 'password';
create schema authorization green;

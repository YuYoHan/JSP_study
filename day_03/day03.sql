create database jsp;
use jsp;
drop table test_user;

create table test_user(
	userid varchar(300) primary key,
    userpw varchar(300),
    username varchar(300)
);
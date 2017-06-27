
create database cgv;

use cgv;


create table member(
	id varchar(50) primary key,
	name varchar(50) not null,
	pass varchar(50) not null,
	email varchar(100) not null
);

create table board(
	b_num int primary key auto_increment,
	b_writer varchar(50),
	b_title varchar(200),
	b_content text,
	b_regdate timestamp default now(),
	b_hit int default 0
);


create table board_reply(
	br_num int primary key auto_increment,
	br_writer varchar(50),
	br_content varchar(500),
	br_regdate timestamp default now(),
	b_num int,
	foreign key(b_num) references board(b_num)
);


create table genre(
	g_num int primary key auto_increment,
	g_name varchar(20)
);


create table movie(
	m_num int primary key auto_increment,
	m_title1 varchar(200),
	m_title2 varchar(200),
	m_producer varchar(100),
	m_grade varchar(30),
	m_time int,
	m_made varchar(50),
	m_company varchar(100),
	m_start date,
	m_end date,
	m_site varchar(300),
	m_like int,
	m_content text,
	m_poster varchar(300),
	g_num int,
	foreign key(g_num) references genre(g_num)
); 


create table actor(
	a_num int primary key auto_increment,
	a_name varchar(50),
	a_birth varchar(20),
	a_nation varchar(50),
	a_img varchar(300),
	m_num int,
	foreign key(m_num) references movie(m_num)
);


create table video(
	v_num int primary key auto_increment,
	v_addr varchar(300),
	m_num int,
	foreign key(m_num) references movie(m_num)
);


create table notice(
	n_num int primary key auto_increment,
	n_cate varchar(20),
	n_title varchar(200),
	n_content text,
	n_regdate timestamp default now(),
	n_hit int default 0
);


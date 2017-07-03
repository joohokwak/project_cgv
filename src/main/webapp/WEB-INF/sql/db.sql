
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

insert into genre values(0, "SF");
insert into genre values(0, "판타지");
insert into genre values(0, "전쟁");
insert into genre values(0, "모험");
insert into genre values(0, "로맨스");
insert into genre values(0, "드라마");
insert into genre values(0, "멜로");
insert into genre values(0, "액션");
insert into genre values(0, "서스펜스");
insert into genre values(0, "스릴러");
insert into genre values(0, "해양과학");
insert into genre values(0, "범죄");
insert into genre values(0, "첩보");
insert into genre values(0, "로맨틱 코미디");
insert into genre values(0, "순정");
insert into genre values(0, "공포");
insert into genre values(0, "호러");
insert into genre values(0, "괴기");
insert into genre values(0, "슬렙스틱 코미디");
insert into genre values(0, "교육");
insert into genre values(0, "아동/청소년");
insert into genre values(0, "스포츠");
insert into genre values(0, "음악");
insert into genre values(0, "뮤지컬");
insert into genre values(0, "심리");
insert into genre values(0, "에로/성인");
insert into genre values(0, "서부");
insert into genre values(0, "갱스터");


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

create table admin(
	admin_id varchar(50) primary key,
	admin_pass varchar(50)
);

insert into admin values('admin','123');

create table notice(
	n_num int primary key auto_increment,
	n_cate varchar(20),
	n_title varchar(200),
	n_content text,
	n_regdate timestamp default now(),
	n_hit int default 0
);

insert into notice values(0,'극장','[CGV용산아이파크몰] 4관 SKYBOX 온라인 예매 이용 제한 안내','내용',now(),0);
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징1','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징2','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징3','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징4','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징5','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징6','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징7','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징8','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징9','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징10','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징11','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징12','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징13','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징14','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징15','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징16','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징17','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징18','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징19','내용없음');
insert into notice(n_num,n_cate,n_title,n_content) values(0,'[테스트]','페이징20','내용없음');

#은 주석. 지우지 않아도 됨.

#스틸컷 테이블
create table stealcut(
 sc_num int primary key auto_increment,
 m_num int,
 sc_img varchar(300),
 foreign key(m_num) references movie(m_num)
);

#극장 테이블
create table theater(
 t_num int primary key auto_increment,
 t_name varchar(30),
 t_addr varchar(100),
 t_tel varchar(20),
 t_cnt_screen int #상영관 개수
);

이름, 상영관 개수,

#상영관  
create table screen(
 s_num int primary key auto_increment,
 s_title varchar(20), #상영관의 이름
 t_num int, #극장fk
 m_num int, #영화fk
 s_cnt_seat int, #좌석의 개수
 foreign key(t_num) references theater(t_num),
 foreign key(m_num) references movie(m_num)
);

#좌석
create table seat(
 seat_num int primary key auto_increment,
 s_num int, #상영관 fk
 seat_name int, #좌석번호 
 foreign key(s_num) references screen(s_num) 
);





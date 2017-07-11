
create database cgv;

use cgv;

create table member(
	id varchar(50) primary key,
	name varchar(50) not null,
	pass varchar(50) not null,
	pic varchar(300) default 'no_pic.png',
	email varchar(100) not null,
	birth varchar(20) not null,
	phone varchar(15) not null,
	point int default 0,
	f1 varchar(30),
	f2 varchar(30),
	f3 varchar(30),
	f4 varchar(30),
	f5 varchar(30)
);

insert into member(id, name, pass, email, birth, phone) values('jh', '주호', '1', 'jhkwak6089@naver.com', '2017.07.01', '010-1234-1234');
insert into member(id, name, pass, email, birth, phone) values('admin', '관리자', '1', 'admin@naver.com', '2017.07.01', '010-1234-1234');

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
insert into genre values(0, "환타지");
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
insert into genre values(0, "어드벤처");

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
	m_genre varchar(300)
);

insert into movie values(0,'박열','Anarchist from Colony','이준익','12세 이상',129,'한국','메가박스(주)플러스엠','2017-06-28','2017-07-13',NULL,0,'"조선인에게는 영웅, 우리한텐 원수로 적당한 놈을 찾아."
1923년, 관동대지진 이후 퍼진 괴소문으로 6천여 명의 무고한 조선인이 학살된다.
  사건을 은폐하기 위해, 관심을 돌릴 화젯거리가 필요했던 일본내각은
 ‘불령사’를 조직해 항일운동을 하던 조선 청년 ‘박열’을 대역사건의 배후로 지목한다.
  
 "그들이 원하는 영웅이 돼줘야지"
  
 일본의 계략을 눈치챈 ‘박열’은 동지이자 연인인 가네코 후미코와 함께
 일본 황태자 폭탄 암살 계획을 자백하고,
 사형까지 무릅쓴 역사적인 재판을 시작하는데....
  
 조선인 최초의 대역죄인!
 말 안 듣는 조선인 중 가장 말 안 듣는 조선인!
 역사상 가장 버릇없는 피고인!
 일본 열도를 발칵 뒤집은 사상 초유의 스캔들! 그 중심에 ‘박열’이 있었다!','Anarchist_from_Colony.jpg','드라마');
 
insert into movie values(0,'트랜스포머:최후의 기사','Transformers: The Last Knight','마이클 베이','12세 이상',151,'미국','롯데엔터테인먼트','
2017-06-21','2017-07-18','transformers5.kr',0,'두 세상의 충돌, 하나만 살아남는다!
 
옵티머스 프라임은 더 이상 인간의 편이 아니다.
트랜스포머의 고향 사이버트론의 재건을 위해 지구에 있는 고대 유물을 찾아나선 옵티머스 프라임은
인류와 피할 수 없는 갈등을 빚고, 오랜 동료 범블비와도 치명적인 대결을 해야만 하는데…
 
영원한 영웅은 없다!
하나의 세상이 존재하기 위해선 다른 세상이 멸망해야 한다!','Transformers5.jpg','액션, SF, 어드벤처');

insert into movie values(0,'헤드윅','Hedwig and the Angry Inch','존 카메론 미첼','15세 이상',91,'미국','(주)엣나인필름','2017-06-28','2017-07-12',NULL,0,'내게 남은 것은 1인치의 사랑과 열정!
세계적인 록스타 ‘토미’의 공연을 쫓아 변두리 바를 전전하며미행 투어를 펼치는 ‘헤드윅’과 ‘앵그리 인치’ 밴드.
과거 ‘토미’와 애틋한 사랑을 나눴던 그녀는 배신당한 것도 모자라
자신의 전부와도 같았던 음악마저 그에게 빼앗긴다.
불행했던 유년시절부터 실패한 사랑까지…
자신의 기구한 삶과 잃어버린 반쪽을 위해 노래하는 그녀.
 
과연 그녀는 진실한 사랑을 찾을 수 있을까?','Hedwig.jpg','뮤지컬');

insert into movie values(0,'리얼','Real','이사랑','청소년 관람불가',137,'한국','CJ 엔터테인먼트','2017-06-28','2017-07-17',NULL,0,'아시아 최대 규모의 카지노를 둘러싼 거대한 음모와 전쟁
"나와 똑같이 생긴 놈이 나타났다"
 
카지노 ‘시에스타’ 오픈을 앞둔 조직의 보스 장태영(김수현) 앞에
 암흑가 대부 조원근(성동일)이 카지노의 소유권을 주장하며 나타난다.
 조원근의 개입으로 카지노를 빼앗길 위기에 처한 장태영은
 자금 문제를 해결하기 위해 투자자를 찾아 나선다.
  
 어느 날, 이름뿐만 아니라 생김새마저 똑같은 의문의 투자자(김수현)가 나타나
 자금은 물론 조원근까지 해결해주겠다는 제안을 한다.
 의문의 투자자의 등장으로 조원근과 카지노를 차지하기 위한 전쟁이 시작되고
 이들을 둘러 싼 거대한 비밀과 음모의 정체가 서서히 드러난다.
  
 오직 진짜만이 모든 것을 갖는다!','Real.jpg','액션');

insert into movie values(0,'지랄발광 17세','The edge of seventeen','켈리 프레몬','15세 이상',105,'미국','소니 픽쳐스','2017-06-28','2017-07-15',NULL,0,'17세 네이딘, 어느 날 갑자기 깨닫다!
자식보다 본인 인생이 더 중요한 엄마, 공부 잘하고 잘 생기고 인기 많은 엄마아들,
이런 엄마아들과 눈 맞은 10년 넘은 베프, 내 존재조차 모르는 짝사랑남,
고민을 상담해도 전혀 도움도, 위로도 안되는 돌직구 선생님까지, 내 주변은 무식하고 이기적인 인간들 투성이다.
그보다 더 끔찍한 사실은 지금 이 얼굴로 평생을 살아야 한다는 것…
망했다… 이번 생은 완전히 망했다!','Seventeen.jpg','코미디, 드라마');

insert into movie values(0,'엘르','Elle','폴 버호벤','청소년 관람불가',131,'독일.벨기에.프랑스','소니 픽쳐스','2017-06-15','2017-07-07',NULL,0,'언제나 당당하고 매력적인 여인 미셸(이자벨 위페르)의 집에 어느 날, 정체를 알 수 없는 괴한이 침입한다. 경찰에 신고하라는 주변의 조언을 무시한 채 아무 일 없다는 듯 일상으로 돌아간 미셸. 하지만 계속되는 괴한의 접근에 위기감을 느끼고, 곧 자신만의 방식으로 범인을 추적해 나간다. 그리고 다시 괴한의 침입이 있던 날, 
감추고 있던 그녀의 과거와 함께 복수를 향한 욕망도 깨어나는데…','Elle.jpg','드라마, 스릴러');

insert into movie values(0,'미이라','The Mummy','알렉스 커츠먼','15세 이상',110,'미국','유니버설픽쳐스인터내셔널코리아','2017-06-06','2017-07-10','mummy2017.kr',0,'신들과 괴물들의 세상, 절대적 존재가 깨어난다!

사막 한 가운데, 고대 이집트 미이라의 무덤을 발견한 닉(톰 크루즈)은
미이라의 관을 수송하던 중 의문의 비행기 추락사고로 사망한다.
그러나 죽음에서 다시 깨어난 닉!

그는 자신이 발견한 미이라 무덤이 강력한 힘을 갈구한 잘못된 욕망으로 인해
산 채로 봉인 당해야 했던 아마네트 공주의 것이며,
자신이 부활하게 된 비밀이 이로부터 시작됨을 감지한다.

한편, 수천 년 만에 잠에서 깨어난 아마네트는
분노와 파괴의 강력한 힘으로 전 세상을 자신의 것으로 만들려 하고,
지킬 박사(러셀 크로우)는 닉에게 의미심장한 이야기를 전하게 되는데...

건드려선 안 될 강력한 존재와 이에 맞선 무한의 힘
마침내 세상을 구할 숙명적인 전쟁이 시작된다!','Mummy.jpg','액션, 환타지, 어드벤처');

insert into movie values(0,'하루','A Day','조선호','15세 이상',90,'한국','CGV 아트하우스','2017-06-15','2017-07-08',NULL,0,'전쟁의 성자라 불리는 의사 ‘준영’(김명민)은 딸의 생일 날 약속 장소로 향하던 중,
대형 교통 사고 현장에서 죽어있는 딸 ‘은정’(조은형)을 발견한다.
충격도 잠시, 다시 눈을 떴을 때 그는 딸의 사고 2시간 전으로 돌아가 있다.
어떻게 해서든 그 날의 사고를 막으려 하지만 결과는 바뀌지 않고
매일 딸이 죽는 지옥 같은 하루를 반복하던 어느 날,
‘준영’ 앞에 그처럼 사고로 아내를 잃은 그 날을 반복하고 있다는 남자 ‘민철’(변요한)이 나타난다.

“당신 뭐야? 다 똑같은데 왜 당신만 달라?”

이유도 모른 채 끔찍한 사고의 시간 속에 갇힌 두 사람은 힘을 합쳐
하루의 끝을 바꾸기로 하지만 어떻게 해도 죽음은 막지 못한다.
사랑하는 이의 죽음을 매일 눈 앞에서 지켜볼 수 밖에 없어 절망하는 두 사람 앞에
자신이 ‘준영’의 딸을 죽인 범인이라고 말하는 의문의 남자가 나타난다.
‘준영’과 ‘민철’은 이 사고가 단순한 사고가 아니라 다른 비밀이 숨겨져 있음을 깨닫는데……

살려야 한다! 하루를 바꿔서라도!
두 남자의 처절한 사투가 시작된다','Day.jpg','스릴러');
 

create table actor(
	a_num int primary key auto_increment,
	a_kor_name varchar(50),
	a_eng_name varchar(50),
	a_birth varchar(20),
	a_nation varchar(50),
	a_job varchar(50),
	a_edulev varchar(100), #학력
	a_site varchar(300),
	a_img varchar(300)
);

#movie와 actor를 연결하는 테이블
create table management(
	mg_num int primary key auto_increment,
	a_num int not null,
	m_num int not null,
	foreign key(a_num) references actor(a_num),
	foreign key(m_num) references movie(m_num)	
);

create table video(
   v_num int primary key auto_increment,
   v_addr varchar(300),
   m_num int,
   foreign key(m_num) references movie(m_num)
);

insert into video values(0, 'https://www.youtube.com/embed/Q5xATvfTcRg', 1);
insert into video values(0, 'https://www.youtube.com/embed/N-KYAsc3LCA', 1);
insert into video values(0, 'https://www.youtube.com/embed/RL-qYJFaF7E', 1);

insert into video values(0, 'https://www.youtube.com/embed/DY5OuHbTpVw', 2);
insert into video values(0, 'https://www.youtube.com/embed/ABMxxbJ7qxE', 2);
insert into video values(0, 'https://www.youtube.com/embed/DfZ5aDQ1aA0', 2);

insert into video values(0, 'https://www.youtube.com/embed/UPUEJhhtqno', 3);
insert into video values(0, 'https://www.youtube.com/embed/qt33oFY7U_g', 3);
insert into video values(0, 'https://www.youtube.com/embed/_zU3U7E1Odc?list=PLA615D14FD3928289', 3);

insert into video values(0, 'https://www.youtube.com/embed/-YHAdp0oZdo', 4);
insert into video values(0, 'https://www.youtube.com/embed/Yb0h3ACB3sE', 4);
insert into video values(0, 'https://www.youtube.com/embed/wzdaYNLeGqQ', 4);

insert into video values(0, 'https://www.youtube.com/embed/Qecjb-xNpCw', 5);
insert into video values(0, 'https://www.youtube.com/embed/RikkdvCqa8A', 5);
insert into video values(0, 'https://www.youtube.com/embed/ErN3DPK6FcY', 5);

insert into video values(0, 'https://www.youtube.com/embed/xROIWDtpKdg', 6);
insert into video values(0, 'https://www.youtube.com/embed/6HifuDzhGro', 6);
insert into video values(0, 'https://www.youtube.com/embed/ONmzggur5Cw', 6);

insert into video values(0, 'https://www.youtube.com/embed/8Pt-F5my5Gw', 7);
insert into video values(0, 'https://www.youtube.com/embed/vgYLz5gtOCI', 7);
insert into video values(0, 'https://www.youtube.com/embed/FcpiKFlTWM8', 7);

insert into video values(0, 'https://www.youtube.com/embed/2Tu2BxKVQss', 8);
insert into video values(0, 'https://www.youtube.com/embed/RqLFB1nEaGI', 8);
insert into video values(0, 'https://www.youtube.com/embed/ueURTHEzUbc', 8);


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

insert into stealcut values(0, 1, '79741145260_727.jpg');
insert into stealcut values(0, 1, '79741145262_727.jpg');
insert into stealcut values(0, 1, '79741145264_727.jpg');
insert into stealcut values(0, 1, '79741145265_727.jpg');
insert into stealcut values(0, 1, '79741145266_727.jpg');
insert into stealcut values(0, 1, '79741145267_727.jpg');

insert into stealcut values(0, 2, '79748145616_727.jpg');
insert into stealcut values(0, 2, '79748145618_727.jpg');
insert into stealcut values(0, 2, '79748145619_727.jpg');
insert into stealcut values(0, 2, '79748145620_727.jpg');
insert into stealcut values(0, 2, '79748145621_727.jpg');
insert into stealcut values(0, 2, '79748145622_727.jpg');
insert into stealcut values(0, 2, '79748145623_727.jpg');

insert into stealcut values(0, 3, '79751145545_727.jpg');
insert into stealcut values(0, 3, '79751145549_727.jpg');
insert into stealcut values(0, 3, '79751145552_727.jpg');
insert into stealcut values(0, 3, '79751145553_727.jpg');
insert into stealcut values(0, 3, '79751145554_727.jpg');

insert into stealcut values(0, 4, '79733145188_727.jpg');
insert into stealcut values(0, 4, '79733145438_727.jpg');
insert into stealcut values(0, 4, '79733145598_727.jpg');
insert into stealcut values(0, 4, '79733145824_727.jpg');
insert into stealcut values(0, 4, '79733145871_727.jpg');
insert into stealcut values(0, 4, '79733145872_727.jpg');
insert into stealcut values(0, 4, '79733145947_727.jpg');

insert into stealcut values(0, 5, '79739145370_727.jpg');
insert into stealcut values(0, 5, '79739145372_727.jpg');
insert into stealcut values(0, 5, '79739145373_727.jpg');
insert into stealcut values(0, 5, '79739145374_727.jpg');
insert into stealcut values(0, 5, '79739145375_727.jpg');
insert into stealcut values(0, 5, '79739145376_727.jpg');
insert into stealcut values(0, 5, '79739145377_727.jpg');

insert into stealcut values(0, 6, '79637145012_727.jpg');
insert into stealcut values(0, 6, '79637145014_727.jpg');
insert into stealcut values(0, 6, '79637145015_727.jpg');
insert into stealcut values(0, 6, '79637145016_727.jpg');
insert into stealcut values(0, 6, '79637145017_727.jpg');

insert into stealcut values(0, 7, '79386145149_727.JPG');
insert into stealcut values(0, 7, '79386145150_727.jpg');
insert into stealcut values(0, 7, '79386145151_727.JPG');
insert into stealcut values(0, 7, '79386145152_727.JPG');
insert into stealcut values(0, 7, '79386145153_727.jpg');
insert into stealcut values(0, 7, '79386145154_727.JPG');

insert into stealcut values(0, 8, '79625144893_727.jpg');
insert into stealcut values(0, 8, '79625144894_727.jpg');
insert into stealcut values(0, 8, '79625144895_727.jpg');
insert into stealcut values(0, 8, '79625144896_727.jpg');
insert into stealcut values(0, 8, '79625144897_727.jpg');
insert into stealcut values(0, 8, '79625144898_727.jpg');


#극장 테이블
create table theater(
	t_num int primary key auto_increment,
	t_name varchar(30),
	t_addr1 varchar(100),
	t_addr2 varchar(100),
	t_tel varchar(20),
	t_cnt_screen int,
	t_img varchar(100)
);

insert into theater values(0, 'CGV강남', '서울특별시 강남구 역삼동 814-6 스타플렉스', '서울특별시 강남구 강남대로 438 (역삼동)', '1544-1122', 874, 'CGVgangnam.jpg');
insert into theater values(0, 'CGV강동', '서울특별시 강동구 성내동 549-1 씨네월드', '서울특별시 강동구 성내로 48 (성내동)', '1544-1122', 1617, 'noimage_final.jpg');
insert into theater values(0, 'CGV강변', '서울특별시 광진구 구의동 546-4 테크노마트 10층', '서울특별시 광진구 광나루로56길 85 (구의동)', '1544-1122', 1663, 'CGVgangbyeon.jpg');
insert into theater values(0, 'CGV구로', '서울특별시 구로구 구로5동 573번지 AK플라자(구 애경백화점) 5층', '서울특별시 구로구 구로중앙로 152 (구로동)', '1544-1122', 1900, 'noimage_final.jpg');
insert into theater values(0, 'CGV군자', '서울특별시 광진구 군자동 477-12', '서울특별시 광진구 능동로 289 (군자동)', '1544-1122', 1197, 'CGVgunja.jpg');

insert into theater values(0, 'CGV대학로', '서울특별시 종로구 명륜2가 41-9', '서울 종로구 대명길 (명륜동)', '1544-1122', 1184, 'daehakro.jpg');
insert into theater values(0, 'CGV명동', '서울특별시 중구 명동2가 83-5번지 눈스퀘어 8층', '서울특별시 중구 명동길 14 (명동)', '1544-1122', 736, 'CGVmyeongdong.jpg');
insert into theater values(0, 'CGV명동역 씨네라이브러리', '서울특별시 중구 충무로2가 65-9 하이해리엇 10,11층', '서울특별시 중구 퇴계로 123 (명동)', '1544-1122', 694, 'LIB.JPG');
insert into theater values(0, 'CGV목동', '서울특별시 양천구 목동 916번지 현대백화점 지하2층', '서울특별시 양천구 목동로 257, 지하2층(목동)', '1544-1122', 1372, 'noimage_final.jpg');
insert into theater values(0, 'CGV미아', '서울특별시 강북구 미아동 35-4 트레지오 쇼핑몰 9층', '서울특별시 강북구 도봉로 34, 9층(미아동)', '1544-1122', 721, 'CGVmia.jpg');

insert into theater values(0, 'CGV불광', '서울특별시 은평구 대조동 14-24 팜스퀘어 11층', '서울특별시 은평구 불광로 20, 11층(대조동)', '1544-1122', 1620, 'noimage_final.jpg');
insert into theater values(0, 'CGV상봉', '서울시 중랑구 상봉동 79-9 상봉듀오트리스 B2F', '서울시 중랑구 상봉로 131 (상봉동)', '1544-1122', 1167, 'sangbong_1.jpg');
insert into theater values(0, 'CGV상암', '서울특별시 마포구 성산동 515번지 월드컵몰 1층', '서울특별시 마포구 월드컵로 240, 1층 (성산동)', '1544-1122', 1691, 'CGVsangam.jpg');
insert into theater values(0, 'CGV성신여대입구', '서울특별시 성북구 동선동 1가 1-2 10~12층', '서울특별시 성북구 동소문로 106, 10~12층(동선동)', '1544-1122', 908, 'noimage_final.jpg');
insert into theater values(0, 'CGV송파', '서울특별시 송파구 장지동 201-27 가든파이브 라이프 영관 10층', '서울특별시 송파구 충민로 66, 10층(문정동)', '1544-1122', 1481, 'CGVsongpa.jpg');

insert into theater values(0, 'CGV신도림', '서울특별시 구로구 구로동 3-25번지 테크노마트 12층', '서울특별시 구로구 새말로 12층(구로동)', '1544-1122', 1522, 'CGVsindorim.jpg');
insert into theater values(0, 'CGV신촌아트레온', '서울특별시 서대문구 창천동 20-25 아트레온 2층', '서울특별시 서대문구 신촌로 129 , 2층(창천동)', '1544-1122', 1468, 'CGVsinchonartreon.jpg');
insert into theater values(0, 'CGV압구정', '서울특별시 강남구 신사동 602, 603-2', '서울특별시 강남구 압구정로30길 45 (신사동)', '1544-1122', 1093, '14889569732790.JPG');
insert into theater values(0, 'CGV여의도', '서울특별시 영등포구 여의도동 국제금융로 10번지 국제금융센터 지하3층', '서울특별시 영등포구 국제금융로 10, 지하3층(여의도동)', '1544-1122', 1305, 'yeouido01.jpg');
insert into theater values(0, 'CGV영등포', '서울특별시 영등포구 영등포동 4가 441-10번지 경방 타임스퀘어 4~7층', '서울시 영등포구 영중로 15, 4층 (영등포동)', '1544-1122', 2797, 'cgvyoungdeungpo.jpg');

insert into theater values(0, 'CGV왕십리', '서울특별시 성동구 행당동 168-1 왕십리 민자역사 5층', '서울특별시 성동구 왕십리광장로 17, 5층(행당동)', '1544-1122', 1840, 'wang.jpg');
insert into theater values(0, 'CGV용산아이파크몰', '서울특별시 용산구 한강로 3가 40-999 아이파크몰 6층', '서울특별시 용산구 한강대로23길 55, 6층(한강로동)', '1544-1122', 2291, '14987154421050.jpg');
insert into theater values(0, 'CGV중계', '서울특별시 노원구 중계동 509-2 홈플러스 중계점 8층', '서울특별시 노원구 동일로204가길 12, 8층(중계동)', '1544-1122', 1179, 'cgvjunggae.jpg');
insert into theater values(0, 'CGV천호', '서울시 강동구 양재대로 1571번지 홈플러스 4층', '서울시 강동구 천호동42 홈플러스 4층', '1544-1122', 1257, 'CGVspeer.jpg');
insert into theater values(0, 'CGV청담씨네시티', '서울특별시 강남구 신사동 651-21', '서울특별시 강남구 도산대로 323 (신사동)', '1544-1122', 749, 'main_chungdam.jpg');

insert into theater values(0, 'CGV피카디리1958', '서울특별시 종로구 돈의동 137 지하2층 ', '서울특별시 종로구 돈화문로5가길', '1544-1122', 1244, 'picadiri.jpg');
insert into theater values(0, 'CGV하계', '서울특별시 노원구 중계동 506-1 건영백화점 지하1층', '서울특별시 노원구 섬밭로 258, 지하1층(중계동)', '1544-1122', 913, 'cgvhagae.jpg');
insert into theater values(0, 'CGV홍대', '서울특별시 마포구 동교동 159-8', '서울특별시 마포구 양화로 153 (동교동) 4층', '1544-1122', 876, 'cgvhongdae.jpg');



#이름, 상영관 개수,

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

insert into screen values (0, '1관 2층', 1, 1, 146);
insert into screen values (0, '4관 3층', 1, 1, 122);
insert into screen values (0, '3관 3층', 1, 2, 150);
insert into screen values (0, '7관 8층', 5, 4, 200);

#상영정보
create table movieTime(
	mt_num int primary key auto_increment,
	mt_date date,
	mt_time varchar(20),
	s_num int,
	foreign key(s_num) references screen(s_num)
);

insert into movieTime values(0, '2017-07-21', '17:30', 1);
insert into movieTime values(0, '2017-07-21', '19:30', 1);
insert into movieTime values(0, '2017-07-21', '09:30', 1);
insert into movieTime values(0, '2017-07-21', '13:00', 1);

insert into movieTime values(0, '2017-07-22', '12:00', 3);
insert into movieTime values(0, '2017-07-21', '12:00', 2);

insert into movieTime values(0, '2017-07-22', '13:00', 4);



#좌석
create table seat(
	seat_num int primary key auto_increment,
	s_num int, #상영관 fk
	mt_num int,
	seat_status varchar(10), #좌석번호 
	foreign key(s_num) references screen(s_num), 
	foreign key(mt_num) references movieTime(mt_num)
);

insert into seat values(0, 1, 1, 'E10');
insert into seat values(0, 1, 2, 'E11');
insert into seat values(0, 1, 2, 'E12');


create table reserve(
	rv_num int primary key auto_increment,
	rv_theater varchar(40),
	rv_screen varchar(40),
	rv_date varchar(30),
	rv_time varchar(20),
	rv_people varchar(50),
	rv_pay varchar(20),
	rv_seat varchar(100),
	id varchar(50),
	m_num int ,
	t_num int,
	s_num int,
	foreign key(id) references member(id),
	foreign key(m_num) references movie(m_num),
	foreign key(t_num) references theater(t_num),
	foreign key(s_num) references screen(s_num)
);

create table movie_re(
	mr_num int primary key auto_increment,
	mr_img varchar(300),
	id varchar(30),
	mr_content varchar(350),
	mr_score double,
	mr_regdate timestamp,
	m_num int,
	foreign key(m_num) references movie(m_num),
	foreign key(id) references member(id)
);






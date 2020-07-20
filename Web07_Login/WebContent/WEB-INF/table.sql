--페이징 처리를 위한 select문
/*
 * between 1 and 5 ==>1page 보여지는 글의 갯수
 * (( 1 == startRowNum / 5 == endRowNum ))
 * 
 * 1-2-3 ... 페이지 번호 ==> '등차수열'
 * 
 * pageNum == 현재 페이지
 * pageRowCount = 5 (한 페이지에 몇 개의 글 목록을 노출할지 정하는 지역변수)
 * pageDisplayCount = 3 (하단의 페이지 번호를 몇 개 노출할 것인지 1~5 or 1~10)
 * 
 * */
select *
from (select result1.*, ROWNUM as rnum
		from(select * from board_file order by num desc) result1 )
where rnum between 1 and 5 --1page


--이미지 갤러리
create table board_gallery(
	num number primary key,
	writer varchar2(100),
	caption varchar2(100),
	imagePath varchar2(100),
	regdate date
);

create sequence board_gallery_seq;


create table board_file(
	nun number primary key,
	writer varchar2(100) not null,
	title varchar2(100) not null,
	orgFileName varchar2(100) not null, --원본 파일명
	saveFileName varchar2(100) not null, --서버에 실제로 저장된 파일명
	fileSize number not null,
	regdate date
);

create sequence board_file_seq;


--사용자(회언) 정보를 저장할 테이블
create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100), --프로필 이미지 경로를 저장할 컬럼
	regdate date
);

create sequence users_seq;
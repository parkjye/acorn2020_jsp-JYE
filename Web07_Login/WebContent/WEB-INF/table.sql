create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100), --프로필 이미지 경로를 저장할 컬럼
	regdate date
)
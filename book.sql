-- ----------------------------------------------
-- 강수빈
-- ----------------------------------------------

-- 1) 테이블 만들기 -----------------------------------

-- author 테이블 데이터 생성
create table author(
	author_id		int				primary key		auto_increment
    ,author_name	varchar(100)	not null
    ,author_desc	varchar(500)	
);

-- book 테이블 데이터 생성
create table book(
	book_id		int				primary key		auto_increment
    ,title		varchar(100)	not null
    ,pubs		varchar(100)	
    ,pub_date	datetime
    ,author_id	int
    ,constraint book_fk foreign key(author_id)
    references author(author_id)
);


-- 2) insert 문 ------------------------------------

-- author 테이블 데이터 
insert into author
values(null, '김문열', '경북 영양');
insert into author
values(null, '박경리', '경상남도 통영');
insert into author
values(null, '유시민', '17대 국회의원');
insert into author
values(null, '기안84', '기안동에서 산 84년생');
insert into author
values(null, '강풀', '온라인 만화가 1세대');
insert into author
values(null, '김영하', '알쓸신잡출연');

-- book 테이블 데이터
insert into book
values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book
values(null, '삼국지', '민음사', '2002-03-01', 1);
insert into book
values(null, '토지', '마로니에북스', '2012-08-15', 2);
insert into book
values(null, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book
values(null, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book
values(null, '순정만화', '재미주의', '2011-08-03', 5);
insert into book
values(null, '26년', '재미주의', '2012-02-04', 5);


-- 3) 테이블 조회
-- author 데이터 조회
select  author_id
		,author_name
        ,author_desc
from author
;

-- book 데이터 조회
select  book_id
		,title
        ,pubs
        ,pub_date
        ,author_id
from book
;

-- 4) where절, inner join 으로 테이블 조회 (결과 동일)

-- where 절
select  b.book_id
		,b.title
        ,b.pubs
        ,b.pub_date
        ,b.author_id
        ,a.author_id
        ,a.author_name
        ,a.author_desc
from book b, author a
where b.author_id = a.author_id
;

-- inner join
select  b.book_id
		,b.title
        ,b.pubs
        ,b.pub_date
        ,b.author_id
        ,a.author_id
        ,a.author_name
        ,a.author_desc
from book b
inner join author a
	on b.author_id = a.author_id
;

-- 5) 김영하 작가도 나오게 출력 (null 포함)
select  b.book_id
		,b.title
        ,b.pubs
        ,b.pub_date
        ,b.author_id
        ,a.author_id
        ,a.author_name
        ,a.author_desc
from author a
left outer join book b
	on a.author_id = b.author_id
order by book_id asc
;

-- 6) 강풀 작가 데이터 변경 ( 온라인 만화가 1세대 -> 서울특별시)
update author
set author_desc = '서울특별시'
where author_id = 5
;


-- 7) 김영하 작가 데이터 삭제
delete from author
where author_id = 6
;


-- 8) 기안84 데이터 삭제 쿼리문 (삭제 안됨)
delete from author
where author_id = 4
;


-- 9) 기안84 데이터 삭제 되지 않는 이유 
/*
작가 번호(author_id) 4번을 책(book테이블 데이터)에서 사용하고 있기 때문에 삭제가 되지 않는다. 
*/

-- 10) 기안84 삭제할 수 있는 방법 
/*
-- book테이블에서 먼저 author_id 4번을 삭제해준 뒤에 author 테이블에서 author_id 4를 삭제해준다.
1)
delete from book
where author_id = 4
;
2)
delete from author
where author_id = 4
;

*/




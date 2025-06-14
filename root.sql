-- ----------------------------------------------
-- 강수빈
-- ----------------------------------------------

-- 계정 생성 (모든 IP에서 접속 가능)
create user 'book'@'%' identified by '1234';

-- DB 생성
create database book_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

use book_db;
show databases;

-- 권한 주기 (모든 권한)
grant all privileges on book_db.* to 'book'@'%';


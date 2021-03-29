    -- 도구 / 데이터베이스 익스포트
    -- 접속 지정
    -- 저장할 파일명 지정 : 익스포트1.sql
    -- 백업할 테이블 선택 (모두)
    
    
    -- 데이터 손실 가정
    -- BACKUP 계정의 테이블 모두 삭제
    
    
    -- 복수
    -- 익스포트1.sql로 부터 테이블 복구
    -- 주의!! 백업한 사용자 계정이 존재해야 함! (동일 계정이 생성되어 있어야 함)
    -- TableSpace가 있어야함
    -- 익스포트1.sql 파일 열고 '스크립트 실행'
    -- 테이블 복구 확인
    
    
    
    
    create table book (
        bookNo VARCHAR2(10) not null primary key,
        bookName varchar2(30),
        bookPrice number(8) default 10000 check(bookPrice > 1000),
        bookDate date,
        pubNo VARCHAR2(10) not null,
        constraint FK_book_publisher foreign key (pubNo) REFERENCES publisher (pubNo)
            );
            
            
        CREATE TABLE publisher (
            pubNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            pubName VARCHAR2(30) NOT NULL
            );
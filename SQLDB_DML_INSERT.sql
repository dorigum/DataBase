
/*
    데이터 조작어 (DML : Data Manupulation Language)
        - 데이터 입력 / 삭제 / 수정 / 검색 (조회)
        - INSERT 문
        - DELETE 문
        - UPDATE 문
        - SELECT 문
*/


/*
    INSERT 문 : 테이블에 새로운 행을 삽입하는 명령어
    형식 : INSERT INTO 테이블명 ( 열 이름 리스트) VALUES (값 리스트);
    예 : INSERT INTO student (stuNo, stuName, stuGrad, depNo)
         VALUES ('2020001', '홍길동', 3, '1');
         
    숫자 : 1
    문자 : '1'
*/


SELECT * FROM book;
SELECT * FROM publisher;

-- book 테이블에 데이터 입력
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
    VALUES('1003', 'DB', 23000, '2019-11-12', '1');
    
    
-- 모든 열에 데이터를 삽입할 경우에는 열 이름 생략 가능
INSERT INTO book
    VALUES('1004', 'C++ 프로그래밍', 18000, '2015-10-10', '2');
    
    
-- student 테이블에 데이터 삽입하고 SELECT 문으로 조회
SELECT * FROM student;

INSERT INTO student VALUES('1002', '이몽룡', 1, '1');
INSERT INTO student VALUES('1003', '오라클', 4, '2');
INSERT INTO student VALUES('1004', '김자바', 3, '2');


-- 여러 개의 데이터를 한번에 INSERT
INSERT ALL
    INTO student VALUES ('1006', '이디비', 2, '3')
    INTO student VALUES ('1007', '성춘향', 2, '3')
    INTO student VALUES ('1008', '변학도', 2, '3')
    INTO student VALUES ('1009', '박커피', 2, '3')
    SELECT * FROM dual;
    
    
    
    
    
    /*
        시퀀스 (sequence)
            - 데이터베이스 객체로 유일한 값으로 일련번호 생성
            - 지정된 수치로 증가하거나 감소
            - 기본키 값을 일련번호 자동 생성할 때 사용
            - 테이블과 독립적으로 저장되고 생성
            - 하나의 시퀀스를 여러 테이블에서 사용 가능
    */
    
    
    -- 시퀀스 생성
    CREATE SEQUENCE NO_SEQ
        START WITH 1
        INCREMENT BY 1
        MAXVALUE 100000
        MINVALUE 1
        NOCYCLE;
        
        
    -- 시퀀스를 적용할 테이블 생성
    CREATE TABLE board (
        bNo NUMBER PRIMARY KEY, -- 기본키 (시퀀스 적용할 열)
        bSubject VARCHAR2(30) NOT NULL,
        bName VARCHAR2(20) NOT NULL
    );
    
    -- 데이터 추가
    INSERT INTO board VALUES (NO_SEQ.NEXTVAL, '추석', '홍길동');
    INSERT INTO board VALUES (NO_SEQ.NEXTVAL, '미세먼지', '이몽룡');
    INSERT INTO board VALUES (NO_SEQ.NEXTVAL, '휴가', '성춘향');
    
    SELECT * FROM BOARD;
    
    -- 현재 시퀀스의 값 검색
    SELECT NO_SEQ.CURRVAL FROM DUAL;
    
 /*
    DUAL 테이블
        - 오라클 자체에서 제공되는 테이블
        1개의 행과 1개의 열만 있는 DUMMY 테이블
        SYS 소유지만, 모든 사용자가 접근 가능
        
        DUAL 테이블 용도
            - 간단하게 함수를 이용해서 계산 결과값을 확인할 때
            특정 테이블을 생성하지 않고 결과값만 리턴 받을 경우
 */
 
 SELECT SYSDATE FROM DUAL;
 SELECT CURRENT_DATE FROM DUAL;
 
 
 -- product 테이블에 기본키 제약 조건 추가
 ALTER TABLE product
 ADD constraint PK_product_prdNo
 PRIMARY KEY (prdNo);
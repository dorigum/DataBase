
    -- 상품 테이블 생성
    -- 제약조건
        -- 기본키 : prdNo, NOT NULL
        -- prdName : NOT NULL
        
        CREATE TABLE product (
            prdNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            prdName VARCHAR2(30) NOT NULL,
            prdPrice NUMBER(8),
            prdCompany VARCHAR2(30)
        );
        
        
        
        CREATE TABLE product (
            prdNo VARCHAR2(10) NOT NULL,
            prdName VARCHAR2(30) NOT NULL,
            prdPrice NUMBER(8),
            prdCompany VARCHAR2(30),
            CONSTRAINT PK_product_prdNo PRIMARY KEY (prdNo)
        );
        
        
        /*
            출판사 테이블 생성 (출판사번호, 출판사명) pubNo, pubName
            제약조건
                - 기본키로 pubNo 지정, NOT NULL
                - pubName : NOT NULL
        */
        
        CREATE TABLE publisher (
            pubNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            pubName VARCHAR2(30) NOT NULL
            );
            
            
            
            /*
               도서 테이블 생성 (도서번호, 도서명, 가격, 발행일, 출판사번호)
              제약조건
                    - 기본키 설정 : bookNo, NOT NULL
                   - 외래키 설정 : pubNo (참조 테이블과 기본키 지정)
                - 출판사 테이블 (Publisher) 참조
                  - bookPrice를 기본값으로 10000 설정, 1000보다 크게 설정
            */
            
            create table book (
                bookNo VARCHAR2(10) not null primary key,
                bookName varchar2(30),
                bookPrice number(8) default 10000 check(bookPrice > 1000),
                bookDate date,
                pubNo VARCHAR2(10) not null,
                constraint FK_book_publisher foreign key (pubNo) REFERENCES publisher (pubNo)
            );
            
            /*
            constraint FK_book_publisher foreign key (pubNo) REFERENCES publisher (pubNo)
            constraint FK_book_publisher foreign key (book 테이블의 pubNo 열(외래키)
            REFERENCES 참조하는 테이블(출판사 테이블)(출판사 테이블의 기본키)
            */
            
            
            
            
            /*
                테이블 생성 순서 : (1) publisher (2) book
                테이블 입력 순서 : (1) publisher (2) book
                이 순서대로 생성하지 않거나 데이터를 입력하지 않으면
                -- [참조 무결성 제약조건] 에 위배해서 오류가 발생
            */
            
            
            
            /*
                1. 서울 출판사
                2. 도서출판 강남
                3. 정보 출판사
            */
            
            
            /*
                테이블 생성
                    - 학생 (student) (학번, 이름, 학과, 학년)
                    - 학과 (department) (학과번호, 학과이름)
                    
                데이터 입력 ( 참조 무결성 제약 조건에 위배되지 않게 데이터를 입력할 수 있는지 보기 위해서)
                    - 각 테이블 2개 정도 입력
                    
                제약조건
                - 기본키 설정
                - 학생은 학과에 소속
                -학생 이름과 학과 이름은 NULL 허용하지 않음
                - 학년은 4를 기본값으로, 범위를 1~4로 설정
            */
            
            -- 학생 테이블 생성
            CREATE TABLE STUDENT (
                stuNo VARCHAR2(20) NOT NULL PRIMARY KEY,
                stuName VARCHAR2(20) NOT NULL,
                stuGrad NUMBER(3) default 4 check (stuGrad >= 1 and stuGrad <= 4 ),
                depNo VARCHAR2(20) not null,
                CONSTRAINT FK_student_department foreign key (depNo) REFERENCES DEPARTMENT (depNo)
            );
            
            
            -- 학과 테이블 생성
            CREATE TABLE DEPARTMENT (
                depNo VARCHAR2(20) NOT NULL PRIMARY KEY,
                depName VARCHAR2(30) NOT NULL
            );
            
            
            
            
            /*
                교수 테이블 생성
                    - 교수는 학과에 소속되어 있다.
                
                과목 테이블 생성
                    - 교수는 과목을 강의한다.
                    - 강의 학점도 기재
            */
            
            create table education (
                eduNo VARCHAR2(10) not null PRIMARY KEY,
                eduName varchar2(30) not null,
                eduScore varchar2(3),
                proNo varchar2(10) not null,
                constraint FK_education_professor foreign key (proNo) REFERENCES professor (proNo)
            );
            
            create table professor (
                proNo varchar2(10) not null primary key,
                proName varchar2(20) not null,
                depNo varchar2(20) not null,
                constraint FK_professor_department foreign key (depNo) REFERENCES DEPARTMENT (depNo)
            );
            
            
            
            
            
            /*
                학과 (학과코드, 학과명, 전화번호)
                학생 (학번, 성명, 학년, 주소, 생년월일, 학과코드)
                교수 (교수번호, 교수명, 직위, 전화번호, 학과코드)
                과목 (과목코드, 과목명, 학점, 교수번호)
                성적 (학번, 과목코드, 성적, 등급) / (학번, 과목코드) 2개를 기본키로 설정 (복합키)
                  : 학생이 과목을 선택해서 성적과 등급을 받음
            */
            
            
            CREATE TABLE SCORES (
                stuNo varchar2(20) not null,
                eduNo varchar2(10) not null,
                score number(3),
                grade VARCHAR2(2),
                CONSTRAINT PK_scores_stuNo_eduNo primary key (stuNo, eduNo),
                CONSTRAINT FK_scores_student FOREIGN key (stuNo) references student (stuNo),
                CONSTRAINT FK_scores_education foreign key (eduNo) references education (eduNo)
            );

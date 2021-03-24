
/*

    (1) 테이블 생성 : CREATE 문
   
    (2) 테이블 수정  : ALTER 문
    
        ALTER TABLE ADD : 열 추가
                                DROP COLUMN : 열 삭제
                                DROP : 여러 개의 열 삭제
                                RENAME COLUMN : 열의 이름 변경
                                MODIFY : 열의 데이터 형식 변경
                                DROP PRIMARY KEY : 기본키 삭제
                                DROP CONSTRAINT : 제약조건 삭제
                                
*/




    -- 열 추가 : STUDENT 테이블에 stuTel 열 추가
    ALTER TABLE student ADD stuTel VARCHAR2(13);
    
    
    -- 여러 개의 열 추가 : stuAge, stuAddress2 열 추가
    ALTER TABLE student ADD (stuAge VARCHAR2(2), stuAddress2 VARCHAR2(50));
    
    
    -- 열의 데이터 형식 변경 : stuAge 열의 타입을 NUMBER(3) 로 변경
    ALTER TABLE student MODIFY stuAge NUMBER(3);
    
    
    -- 열의 제약 조건 변경 : stuName을 NULL로 허용
    ALTER TABLE student MODIFY stuName VARCHAR2(20) NULL;
    
    
    -- 열 이름 변경 : stuTel에서 stuHP로 변경
    ALTER TABLE student RENAME COLUMN stuTel TO stuHP;
    
    
    -- 열 삭제 : stuHP 열 삭제
    ALTER TABLE student DROP COLUMN stuHP;
    
    
    -- 여러 개의 열 삭제 : stuAge, stuAddress, stuAddress2 열 삭제
    -- (나는 stuAddress 가 없어서 stuAddress2만 삭제함!)
    ALTER TABLE student DROP (stuAge, stuAddress2);
    
    
    
    
    
    /*
        테이블 ALTER 연습 문제
            1. product 테이블에 숫자 값을 갖는 prdStock과 제조일을 나타내는 prdDate 열 추가
            2. product 테이블의 prdCompany 열을 NOT NULL로 변경
            3. publisher 테이블에 pubPhone, pubAddress 열 추가
            4. publisher 테이블에서 pubPhone 열 삭제
            
            한 문장씩 실행하고, 테이블 새로고침해서 결과 확인
    */
    
    -- 1. product 테이블에 숫자 값을 갖는 prdStock과 제조일을 나타내는 prdDate 열 추가
    ALTER TABLE product ADD prdStock NUMBER(20);
    ALTER TABLE product ADD prdDate DATE;
    -- => ALTER TABLE product ADD (prdStock NUMBER(20), prdDate DATE);
    
    -- 2. product 테이블의 prdCompany 열을 NOT NULL로 변경
    ALTER TABLE product MODIFY prdCompany VARCHAR2(20) NOT NULL;
    
    -- 3. publisher 테이블에 pubPhone, pubAddress 열 추가
    ALTER TABLE publisher ADD pubPhone VARCHAR2(13);
    ALTER TABLE publisher ADD pubAddress VARCHAR2(50);
    -- => ALTER TABLE publisher ADD (pubPhone VARCHAR2(13), pubAddress VARCHAR2(50));
    
    -- 4. publisher 테이블에서 pubPhone 열 삭제
    ALTER TABLE publisher DROP COLUMN pubPhone;
    
    
    
    
    /*
        기본키 / 외래키 삭제
        * 주의!! (외래키 제약 조건이 설정되어 있는 경우, 기본키를 삭제하면 에러 발생)
        
        학과 테이블의 기본키인 학과코드를 삭제할 경우,
        학과코드를 참조하고 있는 학생 테이블이 존재하기 때문에
        삭제할 수 없다는 에러 발생
    */
    
     -- 제약조건 무시하고 기본키 삭제
    ALTER TABLE department DROP PRIMARY KEY CASCADE;

    -- 외래키 제약 조건 삭제
    ALTER TABLE student DROP CONSTRAINT FK_student_department;
    
    -- 기본키 제약조건 추가
    ALTER TABLE department ADD CONSTRAINT PK_department_depNo PRIMARY KEY (depNo);
    
    -- 외래키 제약조건 추가
    ALTER TABLE student ADD CONSTRAINT FK_student_department FOREIGN KEY (depNo) REFERENCES department (depNo);
    
    
    /*
        ON DELETE CASCADE
        - 기준 테이블의 데이터가 삭제되었을 때
        -- 외래키 테이블의 데이터도 자동으로 삭제되도록 설정
    */
    
    ALTER TABLE student
        ADD CONSTRAINT FK_student_department foreign key (depNo) references department (depNo) on delete cascade;
        
        
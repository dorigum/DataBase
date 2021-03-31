    
    -- 다음과 같은 구조의 테이블에 2개의 레코드를 저장하는 SQL을 작성하세요.
    
    -- 테이블 저장
         CREATE TABLE Student (
            No int NOT NULL PRIMARY KEY,
            name CHAR(10),
            det CHAR(20),
            addr CHAR(80),
            tel CHAR(20)
        );
        
        
        
    -- 레코드 저장
    INSERT INTO Student VALUES(1, '홍길동', '국문학과', '서울', '010-1111-1111');
    INSERT INTO Student VALUES(2, '고길동', '수학과', '인천', '010-2222-2222');
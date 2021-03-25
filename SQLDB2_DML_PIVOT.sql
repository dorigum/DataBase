        /*
            PIVOT() 함수
                - ROW 단위를 COLUMN 단위로 변경
                - 한 열에 포함된 여러 값을 여러 열로 변환하여 테이블 반환식을 회전하고 집계 수행
        */
        
        
        CREATE TABLE pivotTest(
            singer VARCHAR2(10),
            season VARCHAR2(10),
            amount NUMBER(3)
            );
            
        
        INSERT INTO pivotTest VALUES ('김범수', '겨울', 10);
        INSERT INTO pivotTest VALUES ('윤종신', '여름', 15);
        INSERT INTO pivotTest VALUES ('김범수', '가을', 25);
        INSERT INTO pivotTest VALUES ('김범수', '겨울', 4);
        INSERT INTO pivotTest VALUES ('김범수', '봄', 37);
        INSERT INTO pivotTest VALUES ('윤종신', '봄', 40);
        INSERT INTO pivotTest VALUES ('김범수', '가을', 14);
        INSERT INTO pivotTest VALUES ('김범수', '겨울', 22);
        INSERT INTO pivotTest VALUES ('윤종신', '여름', 64);
        
        
        SELECT * FROM pivotTest;
        
        
        SELECT * FROM pivotTest
            PIVOT(SUM(AMOUNT)
                FOR season
                IN ('봄', '여름', '가을', '겨울'));
                
                
    
    
    -- DELETE / DROP / TRUNCTE 실행 속도 확인
    
    -- 50만 건의 데이터 생성
        CREATE TABLE bigTBL1 AS
        SELECT level AS bigID,
            ROUND(DBMS_RANDOM.VALUE(1, 500000), 0) AS numData
        FROM dual
        CONNECT BY level <= 500000;
        
        
        
        CREATE TABLE bigTBL2 AS
        SELECT level AS bigID,
        ROUND(DBMS_RANDOM.VALUE(1, 500000), 0) AS numData
        FROM dual
        CONNECT BY level <= 500000;
        
        
        
        CREATE TABLE bigTBL3 AS
        SELECT level AS bigID,
        ROUND(DBMS_RANDOM.VALUE(1, 500000), 0) AS numData
        FROM dual
        CONNECT BY level <= 500000;
        
        
        
        DELETE FROM bigTBL1; -- 68.644
        COMMIT;
        
        DROP TABLE bigTBL2; -- 0.129
        
        TRUNCATE TABLE bigTBL3; -- 0.132
        
        
        
        -- CONNECT BY 구문 : 테스트용 샘플 데이터 생성해서 사용할 때
            SELECT level
            FROM dual
            CONNECT BY level <= 20;
            
            
        -- LPAD() : 왼쪽에서부터 총 길이만큼 지정한 문자열로 채움
        -- LPAD(값, 문자열길이, 채움문자)
            SELECT '2021년' || LPAD(level, 2, 0) || '월' AS no
            FROM dual
            CONNECT BY level <= 12;
            
            
       /*
            테이블 복사 : 기본키는 복사가 안 됨!! (복사 후 기본키 설정해야 함)
                - CREATE TABLE ... AS SELECT
                - CREATE TABLE 새 테이블명 AS SELECT 복사할 열 FROM 원본 테이블 [WHERE절]
        */
        
        -- book 테이블에서 '2019-01-01' 이후인 데이터만 출력하여 newBook 테이블 생성
        CREATE TABLE newBook AS
        SELECT * FROM book  WHERE bookDate >= '2019-01-01';
        
        SELECT * FROM newBook;
            
         ALTER TABLE newBook
            ADD CONSTRAINT PK_newBook_bookNo
            PRIMARY KEY (bookNo);
                
        
        -- newBook 데이터 모두 삭제
        DELETE FROM newbook;
        
        
        -- 존재하는 테이블에 데이터만 복사 (테이블 구조 동일할 경우)
        INSERT INTO newbook SELECT * FROM book;
        
        
        -- 구조가 다른 테이블 하나 생성
        CREATE TABLE newBook2 (
            bookNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            bookName VARCHAR2(40)
            );
            
            
      -- 존재하는 테이블에 데이터만 복사 (테이블 구조 다를 경우)
        INSERT INTO newBook2(bookNo, bookName)
        SELECT bookNo, bookName FROM book;
  -- 도서명과 가격만 출력
    SELECT bookName, bookPrice FROM BOOK;
    
    -- 저자만 출력
    SELECT bookAuthor FROM book;
    
    
    
    
    -- 중복 제거 - DISTINCT
    -- 속성값이 중복되는 것이 있으면 한번만 출력
     SELECT DISTINCT bookAuthor FROM book;
     
     
     
     
    -- 비교 (=, <, >, <=, >=, !=)
    
    -- 저자가 '홍길동' 인 도서의 도서명, 저자 출력
        SELECT bookName, bookAuthor FROM book WHERE bookAuthor = '홍길동';
    
    --가격이 30000 이상인 도서의 도서명, 가격, 재고 출력
        SELECT bookName, bookPrice, bookStock  FROM book WHERE bookPrice >= 30000;
    
    -- 재고가 3~5 사이인 도서의 도서명, 재고 출력
        SELECT bookName, bookStock FROM book WHERE bookStock >= 3 AND bookStock <= 5;
        
        
        
        
    -- 범위 ( BETWEEN A AND B)
        SELECT bookName, bookStock FROM book WHERE bookStock BETWEEN 3 AND 5;
        
        
        
        
    -- 리스트에 포함 여부 (IN, NOT IN)
    
    -- 출판사 명이 '서울 출판사' (pubNo = '1') 와 '도서출판 강남' (pubNo = '2') 인 도서의
    -- 도서명, 출판사 번호 출력
    -- (1)
        SELECT bookName, pubNo FROM book
        WHERE pubNo IN ('1', '2');
    -- (2)
        SELECT bookName, pubNo FROM book
        WHERE pubNo = '1' OR pubNo = '2';
        
        
    -- 출판사명이 '도서출판 강남' (pubNo = '2') 이 아닌 도서의
    -- 도서명, 출판사번호 출력
        SELECT bookName, pubNo FROM book
        WHERE pubNo NOT IN ('2');
        
        
        
        SELECT * FROM client;
        
    -- NULL 여부 ( IS NULL, IS NOT NULL);
        
    -- 모든 고객명, 취미 출력
        SELECT clientName, clientHobby FROM client;
        
    -- 취미에 NULL 값이 들어 있는 행만 출력
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby IS NULL;
        
    -- 취미에 NULL 값이 아닌 행만 출력
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby IS NOT NULL;
        
    -- 취미에 공백이 들어 있는 행만 출력
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby = ' ';
        
        
        
        
    -- 논리 (AND, OR)
    
    -- 저자가 '홍길동' 이면서 재고가 3권 이상인 모든 도서 출력
        SELECT * FROM book
        WHERE bookAuthor = '홍길동' AND bookStock >= 3;
    
    -- 저자가 '홍길동' 이거나 '성춘향' 인 모든 도서 출력
        SELECT * FROM book
        WHERE bookAuthor = '홍길동' OR bookAuthor = '성춘향';
        
        
        
    -- 패턴 매칭 (LIKE)
    /*
        '홍%' : '홍' 으로 시작하는 문자열 검색
        '%길%' : '길' 을 포함하는 문자열 ('길' 앞, 뒤에 아무 문자가 와도 됨)
        '%동' : '동' 으로 끝나는 문자열
        '____' : 4개의 문자로 구성된 문자열 (밑줄 문자 1개가 1개 문자)
        
        % : 0개 이상의 문자를 가진 문자열
        _ : 단일 문자 (수 만큼의 문자로 구성) (LIKE '__')
    */
    
    
    
    -- 출판사 테이블에서 출판사명에 '출판사' 가 포함된 모든 행 출력
        SELECT * FROM publisher
        WHERE pubName LIKE '%출판사%';
    
    -- 고객 테이블에서 출생년도가 1990년대인 모든 행 출력
        SELECT * FROM client
        WHERE clientBirth LIKE '199%';
    
    -- 고객 테이블에서 이름이 4글자인 고객 출력
        SELECT * FROM client
        WHERE clientName LIKE '____';
    
    -- 도서 테이블에서 도서명에 '안드로이드' 가 포함되어 있지 않은 도서의 도서명 출력
        SELECT bookName FROM book
        WHERE bookName NOT LIKE ('%안드로이드%');
        
        


    /*
        ORDER BY
            - 특정 열의 값을 기준으로 질의 결과 정렬
            - ASC : 오름차순 (디폴트 : 생략 가능)
            - DESC : 내림차순
    */
    
    -- 도서명 순으로 도서 검색 ( 기본 : 오름차순 (ASC 생략 가능))
        SELECT * FROM book
        ORDER BY bookName;
        
        SELECT * FROM book
        ORDER BY bookName ASC;
        
    -- 도서명 순으로 내림차순 검색 (DESC)
        SELECT * FROM book
        ORDER BY bookName DESC;
        
    -- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하여
    -- 도서명, 저자, 재고 출력
        SELECT bookName, bookauthor, bookstock  FROM book
        ORDER BY bookstock DESC;
        
        
    -- 2차 정렬 (1차 정렬 결과에서 동일한 경우, 다시 2차 정렬 가능)
    -- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하여
    -- 도서명, 저자, 재고 출력
    -- 재고 수량이 동일한 경우, 저자명으로 오름차순 2차 정렬
    
    -- ASC 입력
        SELECT bookName, bookauthor, bookstock  FROM book
        ORDER BY bookstock DESC, bookauthor ASC;
        
    -- ASC 생략 (생략 가능, 결과는 동일)
        SELECT bookName, bookauthor, bookstock  FROM book
        ORDER BY bookstock DESC, bookauthor;
        
    
    
    
    
    /*
        집계 함수
        - SUM() : 합계
        - AVG() : 평균
        - COUNT() : 선택된 열의 행의 수 (NULL값은 제외)
        - COUNT(*) : 전체 행의 수
        - MAX() : 최대값
        - MIN() : 최소값
    */
    
    
    -- SUM() : 합계
    
    -- 도서 테이블에서 총 재고 수량 계산해서 출력
        SELECT SUM(bookstock) FROM book;
        
        
    -- 열 이름 'sum of bookStock' 지정
        SELECT SUM(bookstock) AS "sum of bookStock"
        FROM book;
        
        
    -- 열 이름 한글도 가능
        SELECT SUM(bookstock) AS "총 재고량"
        FROM book;
        
        
    -- 도서 판매 테이블에서
    -- 고객번호 2인 호날두가 주문한 도서의 총 주문수량 계산하여 출력
        SELECT SUM(bsQty) AS "총 주문 수량"
        FROM booksale
        WHERE clientNo = '2';
        
        SELECT clientNo, bsQty FROM booksale;
        
        
    -- 도서 판매 테이블에서 최대/최소 주문량 출력
        SELECT MAX(bsQty) AS "최대 주문량", MIN(bsQty) AS "최소 주문량"
        FROM booksale;
        
        
    -- 도서 테이블에서 도서의 '가격 총액', '평균 가격', '최고가', '최저가' 출력
        SELECT SUM(bookprice) AS "가격 총액",
                        AVG(bookprice) AS "평균 가격",
                        MAX(bookprice) AS "최고가",
                        MIN(bookprice) AS "최저가"
        FROM book;
        
        
    -- 열 이름에 공백이 들어 있지 않으면 "" 없어도 됨
        SELECT SUM(bookprice) AS "가격 총액",
                         AVG(bookprice) AS 평균가격,
                         MAX(bookprice) "최고가",
                         MIN(bookprice) "최저가"
        FROM book;
        
        
        
        
    -- 도서 판매 테이블에서 도서 판매 건수 출력 (모든 행의 수)
        SELECT COUNT(*) AS "총 판매 건수"
        FROM bookSale;
        
    
    -- 고객 테이블에서 총 고객 수 (모든 행의 수)
        SELECT COUNT(*) AS "총 고객수"
        FROM client;
        
        
    -- 고객 테이블에서 총 취미 개수 출력 (NULL 값만 제외)
        SELECT COUNT(clientHobby) AS 취미
        FROM client;
        
        SELECT clientHobby FROM client;
        
        
        
        
        
        /*
            GROUP BY 열 이름
                - 그룹 질의를 기술할 때 사용
                - 특정 열로 그룹화한 후, 각 그룹에 대해 한 행씩 질의 결과 생성
                - 주의!! (SELECT 절의 열 이름은 GROUP BY에서 사용한 열 이름과 집계 함수만 나올 수 있다)
        */
        
        SELECT bookNo, SUM(bsQty) AS "주문량 합계"
        FROM bookSale
        GROUP BY bookNo;
        
        
        -- GROUP BY 절에서 정렬
        SELECT bookNo, SUM(bsQty) AS "주문량 합계"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY bookNo;
        
        -- 첫번째 열
        SELECT bookNo, SUM(bsQty) AS "주문량 합계"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY 1;
        
        -- 두번째 열
        SELECT bookNo, SUM(bsQty) AS "주문량 합계"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY 2;
        
        -- 새로 추가한 열 이름 사용 가능
        SELECT bookNo, SUM(bsQty) AS "주문량 합계"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY "주문량 합계";
        
        
        
        /*
            HAVING 검색 조건
                - GROUP BY 절에 의해 구성된 그룹에 대해 적용할 조건 기술
                - SUM(), AVG(), MAX(), MIN(), COUNT() 등 집계 함수와 함께 사용
        */
        
        
        -- 도서 테이블에서 가격이 25000 이상인 도서에 대해서
        -- 출판사 별로(그룹화) 도서 수 합계 출력. 단, 도서 수 합계가 2 이상인 경우만 출력
        SELECT pubNo, COUNT(*) AS "도서 수 합계"
        FROM book
        WHERE bookPrice >= 25000
        GROUP BY pubNo
        HAVING COUNT(*) >= 2;
        
        
        
        
        
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
            

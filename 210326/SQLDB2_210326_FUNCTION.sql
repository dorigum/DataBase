
    -- 내장 함수
    
    /*
        문자 함수
            - REPLACE() : 문자열 치환
            - LENGTH() : 글자 수 반환
            - LENGTHB() : 바이트 수 반환
            - SUBSTR() : 지정한 길이만큼의 문자열 반환
    */
    
      -- REPLACE() : 문자열 치환
        SELECT REPLACE('자바 프로그래밍', '자바', '파이썬') FROM dual;
        
    -- '자바' 전체를 '파이썬' 으로 치환
    
    -- TRANSLATE()
    SELECT TRANSLATE('apple aiplane apart', 'ap', '*^') FROM dual;
    -- 'ap' 를 '*^'로 치환
    -- 첫번째 문자 a는 *로 치환,
    -- 두번째 문자 p는 ^로 치환
    
    
    -- book 테이블에서 도서명에 '안드로이드' 가 포함된 도서에 대해
    -- '안드로이드' 를 'Android' 로 변경해서 출력
     SELECT * FROM book;
     
     SELECT bookNo, REPLACE(bookName, '안드로이드', 'Android') AS bookName, bookAuthor, bookPrice
     FROM book
     WHERE bookName LIKE '%안드로이드%';
     
     -- LENGTH() : 글자 수 반환
     -- LENGTHB() : 바이트 수 반환
     -- '서울 출판사' 에서 출간한 도서의 도서명과 도서명의 글자수, 바이트 수, 출판사명 출력
        SELECT B.bookName AS "도서명", LENGTH(B.bookName) AS "길이",
                                                                LENGTHB(B.bookName) AS "출판사"
        FROM book B
            INNER JOIN publisher P ON B.pubNo = P.pubNo
        WHERE P.pubName = '서울 출판사';
        
        -- 한글 (UTF-8) : 3바이트
        -- 영문자, 숫자, 스페이스 : 1바이트
        
        
        
        -- SUBSTR() : 지정한 길이만큼의 문자열 반환
        -- SUBSTR(전체 문자열, 시작 위치, 길이)
        
        -- 도서 테이블 : 저자 이름에서 성씨만 출력
            SELECT SUBSTR(bookAuthor, 1, 1) AS "성"
            FROM book;
    
        -- 저자 이름에서 성씨 제외한 이름만 출력
            SELECT SUBSTR(bookAuthor, 2, 2) AS "이름"
            FROM book;
                
                
        -- 저자 이름 중에서 성씨가 '손' 인 모든 저자 출력
            SELECT bookAuthor
            FROM book
            WHERE SUBSTR(bookAuthor, 1, 1) = '손';
            
            
        -- 저자 이름에서 같은 성씨를 가진 사람이 몇 명이나 되는지 알아보기 위해
        -- 성씨 별로 그룹지어 인원 수를 출력
        SELECT SUBSTR(bookAuthor, 1, 1) AS "성", COUNT(*) AS "인원 수"
        FROM book
        GROUP BY SUBSTR(bookAuthor, 1, 1);
        
        
        
        -- CONCAT() : 문자열 연결 함수
        -- || : 문자열 연결 연산자
        SELECT CONCAT('문자열', ' 연결 방법1'), '문자열' || ' ' || '연결 방법2'
        FROM dual;
        
        -- 저자 : 도서명 : 가격 형식으로 출력
        SELECT bookAuthor || ' : ' || bookName || ' : ' || bookPrice
        FROM book;    
        
        
        
        -- INSTR(기준 문자열, 지정된 문자열, 찾을 시작 위치, 출현 위치) : 위치 변환
        -- 문자열(string)에서 지정된 문자열(substring)을 찾아서 위치 변환
        -- 지정된 문자열이 첫번째 출현하는 위치 반환
        SELECT INSTR('초등학생 고등학생 대학생', '학생', 1, 1)   -- 3 출력
        FROM dual;
        
        -- 다섯번째 문자부터 찾아서 두번째 나오는 위치
        SELECT INSTR('초등학생 중학생 고등학생 대학생', '학생', 5, 2) FROM dual;
        
        
        
        -- LOWER() / UPPER() / INITCAP() : 첫 글자를 대문자로 변환
        SELECT LOWER('Java Programming'), UPPER('Java Programming'), INITCAP('java programming')
        FROM dual;
        
        
        
        -- LPAD(문자열, 길이, 채울 문자열) : 왼쪽부터 채움
        -- RPAD(문자열, 길이, 채울 문자열) : 오른쪽부터 채움
        SELECT LPAD('데이터베이스', 20, '*') FROM dual;
        SELECT RPAD('데이터베이스', 20, '*') FROM dual;
        
        
        
        -- TRIM(제거할 방향 FROM 문자열) : 문자열 앞 뒤 공백 제거
        -- 제거할 방향 : LEADING(앞), BOTH(양쪽), TRAILING(뒤)
        SELECT TRIM('       대한민국        ') FROM dual;
        SELECT TRIM(LEADING '*' FROM '***데이터베이스***') FROM dual;
        SELECT TRIM(TRAILING '*' FROM '***데이터베이스***') FROM dual;
        SELECT TRIM(BOTH '*' FROM '***데이터베이스***') FROM dual;
        
        
        
        
        -- 순위 출력 함수
        -- RANK() / DENSE_RANK() / ROW_NUMBER()
        -- RANK() : 값의 순위 반환(동일 순위 개수만큼 증가)
        -- DENSE_RANK() : 값의 순위 반환 (동일 순위 상관 없이 1 증가)
        -- ROW_NUMBER() : 행의 순위 반환
        SELECT bookPrice,
                        RANK() OVER (ORDER BY bookPrice DESC) "RANK",
                        DENSE_RANK() OVER (ORDER BY bookPrice DESC) "DENSE_RANK",
                        ROW_NUMBER() OVER (ORDER BY bookPrice DESC) "ROW_NUMBER"
        FROM book;
        
        
        
        -- TOP N 출력 : ROWNUM 사용
        -- 도서 가격순위 1~5위 출력
        -- 테이블 내에서 정렬을 해준 후에 순위를 출력
        SELECT ROWNUM, bookPrice
        FROM (SELECT bookPrice FROM book ORDER BY bookPrice DESC) book
        WHERE ROWNUM BETWEEN 1 AND 5;
        
        -- 이렇게 작성하면 book 테이블 내에 작성되어 있는 순서대로 1~5번째 데이터가 출력되어버림ㅠㅠ
        SELECT ROWNUM, bookPrice
        FROM book
        WHERE ROWNUM BETWEEN 1 AND 5
        
        
        
        -- 그룹의 소계와 총계 출력
        -- ROLLUP() / CUBE() / GROUPING SETS()
        -- ROLLUP()
            -- 그룹의 소계와 총계 산출
            -- 순서가 중요★ 맨 앞에 놓인 것에 소계 산출
        
        -- CUBE()
            -- 각 그룹의 모든 경우의 수에 대한 소계와 총계 산출
            -- 항목들간 다차원적인 소계를 계산
        
        -- GROUPING SETS()
            -- 특정 항목에 대한 소계 산출
       
       CREATE TABLE cubeTBL (
        prdName varchar2(10),
        color varchar2(6),
        amount number(2)
       );
       
       INSERT INTO cubeTBL VALUES('컴퓨터', '검정', 11);
       INSERT INTO cubeTBL VALUES('컴퓨터', '파랑', 22);
       INSERT INTO cubeTBL VALUES('모니터', '검정', 33);
       INSERT INTO cubeTBL VALUES('모니터', '파랑', 44);
       INSERT INTO cubeTBL VALUES('마우스', '검정', 55);
       INSERT INTO cubeTBL VALUES('마우스', '파랑', 66);
       
       
       SELECT * FROM CUBETBL;
       
       
       -- CUBE() 함수 : 각 그룹의 모든 경우의 수에 대한 소계와 총계를 산출
       -- 항목들 간 다차원적인 소계를 계산
       -- 상품별 소계
       -- 색상별 소계
       -- 총계
       -- 모든 항목 소계
       SELECT prdName, color, SUM(amount) AS "수량 합계"
       FROM cubeTBL
       GROUP BY CUBE(color, prdName)
       ORDER BY prdName, color;
       

       SELECT prdName, color, SUM(amount) AS "수량 합계"
       FROM cubeTBL
       GROUP BY CUBE(prdName, color) -- prdName과 color의 순서 변경 (순서 상관 없이 결과 산출)
       ORDER BY prdName, color;
       
       
       -- ROLLUP() : 그룹의 소계와 총계 산출
       -- ★순서가 중요. 맨 앞에 놓인 것에 대해서만 소계 산출
       
       -- 상품별 소계만 출력 -> 색상별 소계는 출력X
       -- 총계 
       SELECT prdName, color, SUM(amount) AS "수량 합계"
       FROM cubeTBL
       GROUP BY ROLLUP(prdName, color) -- 맨 처음에 있는 prdName에 대해서만 소계 산출
       ORDER BY prdName, color;
       
       -- 색상별 소계만 출력
       SELECT prdName, color, SUM(amount) AS "수량 합계"
       FROM cubeTBL
       GROUP BY ROLLUP(color, prdName) -- 맨 처음에 있는 color에 대해서만 소계 산출
       ORDER BY prdName, color;
       
       
       -- GROUPING SETS()
       -- 특정 항목에 대한 소계 산출
       -- 항목별 소계만 출력
       SELECT prdName, color, SUM(amount) AS 매출액
       FROM cubeTBL
       GROUP BY GROUPING SETS(prdName, color);
       
       
       -- 어느 행이 먼저 출력되느냐 차이
       SELECT prdName, color, SUM(amount) AS 매출액
       FROM cubeTBL
       GROUP BY GROUPING SETS(color, prdName); -- 앞의 항목을 먼저 출력
       
       
       
       -- ROLLUP() / CUBE() / GROUPING SETS() 예제2
       CREATE TABLE sales (
        prdName varchar2(20),
        salesDate varchar2(10),
        prdCompany varchar2(10),
        salesAmount number(8)
       );
       
       INSERT INTO sales VALUES ('노트북', '2021.01', '삼성', 10000);
       INSERT INTO sales VALUES ('노트북', '2021.03', '삼성', 20000);
       INSERT INTO sales VALUES ('냉장고', '2021.01', 'LG', 12000);
       INSERT INTO sales VALUES ('냉장고', '2021.03', 'LG', 20000);
       INSERT INTO sales VALUES ('프린터', '2021.01', 'HP', 3000);
       INSERT INTO sales VALUES ('프린터', '2021.03', 'HP', 1000);
       
       SELECT * FROM SALES;
       
       
       -- CUBE() 함수 사용해서 소계 및 총계 출력
       -- 상품별 소계
       -- 날짜별 소계
       -- 총계
        SELECT prdName, salesDate, SUM(salesAmount) AS 매출액
        FROM sales
        GROUP BY CUBE(prdName, salesDate) -- 순서 바뀌어도 결과는 동일
        ORDER BY prdName, salesDate;
       
       
       -- ROLLUP() 함수 사용해서 소계 및 총계 출력
       -- prdName (상품별 소계만 출력)
       -- 총계 출력
       SELECT prdName, salesDate, SUM(salesAmount) AS 매출액
       FROM sales
       GROUP BY ROLLUP(prdName, salesDate); -- 상품별 소계만 출력 (앞의 것만 소계 산출)
       
       -- salesDate (날짜별 소계만 출력)
       -- 총계
       SELECT prdName, salesDate, SUM(salesAmount) AS 매출액
       FROM sales
       GROUP BY ROLLUP(salesDate, prdName); -- 날짜별 소계만 출력 (앞의 것만 소계 산출)

       
       -- GROUPING SETS() 함수 사용해서 소계 및 총계 출력
       SELECT prdName, salesDate, SUM(salesAmount) AS 매출액
       FROM sales
       GROUP BY GROUPING SETS(prdName, salesDate); -- 상품별 소계가 먼저 출력
       
       
       SELECT prdName, salesDate, SUM(salesAmount) AS 매출액
       FROM sales
       GROUP BY GROUPING SETS(prdName, salesDate); -- 날짜별 소계가 먼저 출력
       
       
       
       -- 기존 테이블을 이용하여 다양한 소계, 총계 출력해보기
       SELECT pubNo, SUM(bookPrice)
       FROM book
       GROUP BY CUBE(pubNo); -- 요건 내가 작성해본 것
       
       
       SELECT bookNo, bsDate, SUM(bsQty) AS "총 주문 수량"
       FROM bookSale
       GROUP BY CUBE(bookNo, bsDate)
       ORDER BY bookNo, bsDate;
       
       
       SELECT bookNo, bsDate, SUM(bsQty) AS "총 주문 수량"
       FROM bookSale
       GROUP BY ROLLUP(bookNo, bsDate)
       ORDER BY bookNo, bsDate;
       
       
       SELECT bookNo, bsDate, SUM(bsQty) AS "총 주문 수량"
       FROM bookSale
       GROUP BY ROLLUP(bsDate, bookNo)
       ORDER BY bookNo, bsDate;
       
       
       
       
       /*
            날짜 관련 함수
            -- EXTRACT() / ADD_MONTHS()
            -- 형 변환 함수 : TO_CHAR()
        */
        
        -- 현재 날짜 출력
        SELECT SYSDATE FROM dual;
        SELECT CURRENT_DATE FROM dual;
        
        
        SELECT SYSDATE + 1 FROM dual; -- 현재 날짜에서 1일 후 날짜 출력
        SELECT SYSDATE -1 FROM dual; -- 현재 날짜에서 1일 전 날짜 출력
        
        -- 어제, 오늘, 내일 날짜 출력
        SELECT SYSDATE - 1 어제, SYSDATE 오늘, SYSDATE + 1 내일 FROM dual;
        
        
        
        -- ADD_MONTHS()
        -- 1달 후
        SELECT ADD_MONTHS(SYSDATE, 1) FROM dual;
        
        -- 1달 전
        SELECT ADD_MONTHS(SYSDATE, -1) FROM dual;

        -- 1년 후
        SELECT ADD_MONTHS(SYSDATE, 12) FROM dual;
        
        -- 1년 전
        SELECT ADD_MONTHS(SYSDATE, -12) FROM dual;
        
        
        -- EXTRACT() : 현재 날짜에서 년, 월, 일 추출
        SELECT  EXTRACT(YEAR FROM SYSDATE) 년,
                        EXTRACT(MONTH FROM SYSDATE) 월,
                        EXTRACT(DAY FROM SYSDATE) 일
        FROM dual;
        
        
        -- 작년, 올해, 내년
        SELECT  EXTRACT(YEAR FROM SYSDATE) -1 작년,
                        EXTRACT(YEAR FROM SYSDATE) 올해,
                        EXTRACT(YEAR FROM SYSDATE) +1 내년
        FROM dual;
        
        
        
        -- (1) 도서주문 테이블에서 주문일에 7일을 더한 날을 배송일로 계산해서 출력
        -- 주문일, 배송일
        -- 날짜 연산
        -- 날짜 + 숫자 : 날짜로부터 기간만큼 지난 날짜 계산
        -- 주문일에 7일을 더한 날을 배송일로 계산
        SELECT bsDate AS 주문일, bsDate + 7 AS 배송일
        FROM bookSale;
        
        -- (2) 도서 테이블에서 도서명과 출판연도 출력 (EXTRACT() 함수 사용)
        SELECT  bookName AS 도서명, EXTRACT(YEAR FROM bookDate) AS 출판연도
        FROM book;
        
        
        -- 현재 시간 출력
        SELECT CURRENT_TIMESTAMP FROM dual;
        
        SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') FROM dual;
        SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM dual; -- 24시간제
        
        
        -- 시간 추출
        SELECT  TO_CHAR(SYSDATE, 'HH24') 시,
                        TO_CHAR(SYSDATE, 'MI') 분,
                        TO_CHAR(SYSDATE, 'SS') 초
        FROM dual;
        
        
        -- 날짜 추출 : 년, 월, 일
        SELECT  TO_CHAR(SYSDATE, 'YYYY') 년,
                        TO_CHAR(SYSDATE, 'MM') 월,
                        TO_CHAR(SYSDATE, 'DD') 일
        FROM dual;
        
        
        -- bookSale 테이블에서 주문 날짜를 '월' 로 표시
        SELECT bsDate AS "주문일자", TO_CHAR(bsDate, 'MM') AS "주문 월"
        FROM bookSale;
        
        
        
        -- NVL2(값, NULL이 아닌 경우 반환, NULL인 경우 반환)
        SELECT clientHobby, NVL2(clientHobby, 'Y', 'N')
        FROM client;
        
        -- 취미가 NULL인 경우와 빈칸인 경우를 찾아서 "없음" 으로 변경
        SELECT clientHobby FROM client;
        
        UPDATE client SET clientHobby = '없음'
        WHERE NVL2(clientHobby, 'Y', 'N') = 'N' OR clientHobby = ' ';
        
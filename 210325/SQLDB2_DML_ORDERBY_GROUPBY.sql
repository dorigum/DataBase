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

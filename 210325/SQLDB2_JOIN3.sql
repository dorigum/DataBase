
    -- 고객 호날두의 주문수량 조회
    -- 1. client 테이블에서 '호날두' 의 clientNo를 찾아서
    -- 2. bookSale 테이블에서 이 clientNo에 해당되는 도서에 대해
    -- 3. 주문일, 주문수량 출력
    
    SELECT bsDate, bsQty
    FROM bookSale
    WHERE clientNo = ( SELECT clientNo
                                    FROM client
                                    WHERE clientName = '호날두');
                                    
                                    
    -- 고객 호날두가 주문한 총 주문 수량 출력
    SELECT SUM(bsQty) AS "총 주문 수량"
    FROM bookSale
    WHERE clientNo = ( SELECT clientNo
                                    FROM client
                                    WHERE clientName = '호날두');
                                    
                                    
    -- 가장 비싼 도서의 도서명과 가격 출력
    SELECT bookName, bookPrice
    FROM book
    WHERE bookPrice = ( SELECT MAX(bookPrice)
                                        FROM book);
                                        
                                        
    -- 도서의 평균 가격보다 비싼 도서의 도서명, 가격 출력
    -- 참고 : 평균 도서 가격
    SELECT AVG(bookPrice) AS "평균 도서 가격"
    FROM book;
    
    SELECT bookName, bookPrice
    FROM book
    WHERE bookPrice > ( SELECT AVG(bookPrice) AS "평균 도서 가격"
                                        FROM book);
                                        
                                        
    -- 정보출판사에서 출간한 도서를 구매한 적이 있는 고객명 출력
    -- 고객명 출력
                                        --도서를 구매한 적 있는
                                                                            -- 출판사의 도서
                                                                                                        -- 정보출판사
    SELECT clientName
    FROM client
    WHERE clientNo IN (SELECT clientNo
                                        FROM bookSale
                                        WHERE bookNo IN ( SELECT bookNo
                                                                            FROM book
                                                                            WHERE pubNo IN (SELECT pubNo
                                                                                                            FROM publisher
                                                                                                            WHERE pubName = '정보출판사')));
                                                                                                            



    -- 한번도 주문한 적이 없는 고객의 고객번호, 고객명 출력
    SELECT clientNo, clientName
    FROM client
    WHERE clientNo NOT IN (SELECT clientNo
                                                FROM bookSale);
                          
                                                
    SELECT clientNo, clientName
    FROM client
    WHERE NOT EXISTS (SELECT clientNo
                                FROM bookSale
                                WHERE client.clientNo = bookSale.clientNo);                                                                                                                   
                                                
                                                
    SELECT clientNo, clientName
    FROM client
    WHERE EXISTS (SELECT clientNo
                                FROM bookSale
                                WHERE client.clientNo = bookSale.clientNo);
                                
    -- NULL인 경우, IN과 EXISTS 차이
    SELECT clientHobby FROM client;
    
    -- EXISTS : 서브 쿼리 결과에 NULL값 포함
    -- NULL값 포함하여 모든 clientNo 출력
    SELECT clientNo
    FROM client
    WHERE EXISTS (SELECT clientHobby
                                FROM client);
                                
   -- IN : 서브 쿼리 결과에 NULL값 포함되지 X
   -- NULL값을 갖지 않는 clientNo만 출력
    SELECT clientNo
    FROM client
    WHERE clientHobby IN (SELECT clientHobby
                                FROM client);
                                
    
    -- ALL : 검색 조건이 서브 쿼리의 결과의 모든 값에 만족하면 참이 되는 연산자
    -- 조건 > ALL (서브 쿼리 결과)
    -- 2번 고객이 주문한 도서의 최고 주문수량보다 더 많은 도서를 구입한 고객
    -- 2번 고객이 주문한 모든 주문에서 발생한 주문수량보다 더 많은 도서를 구입한 고객
    -- ALL 사용
    SELECT clientNo, bsNo, bsQty
    FROM bookSale
    WHERE bsQty > ALL (SELECT bsQty
                                        FROM bookSale
                                        WHERE clientNo = '2');
                                         
    SELECT * FROM bookSale;
    
    -- ANY 사용
    SELECT clientNo, bsNo, bsQty
    FROM bookSale
    WHERE bsQty > ANY (SELECT bsQty
                                        FROM bookSale
                                        WHERE clientNo = '2');
                                        
      
                                        
    /*
        서브 쿼리 유형
            - 스칼라 서브 쿼리 : SELECT 절 위치 / 단일 열 반환
            - 인라인 뷰 : FROM 절 위치 / 결과를 뷰(가상 테이블) 형태로 반환
            - 중첩 서브 쿼리 : WHERE 절 위치 / 결과를 한정시키기 위해 사용 (정보출판사에 출간한 도서)
    */
    
    
    -- 스칼라 서브 쿼리 : SELECT 절에서 사용
    -- 결과 값을 단일 열의 스칼라 값으로 반환
    -- 고객 별로 총 주문 수량 출력
    SELECT clientNo, (SELECT clientName
                                    FROM client
                                    WHERE client.clientNo = bookSale.clientNo) AS "고객명", SUM(bsQty)
    FROM bookSale
    GROUP BY clientNo;
    
    
    -- 인라인 뷰 : FROM 절에서 사용
    -- 결과를 뷰(가상 테이블) 형태로 반환
    SELECT bookName, bookPrice, SUM(bsQty) AS "총 판매 수량", SUM(bookPrice * bsQty) AS "총 판매액"
    FROM (SELECT bookNo, bookName, bookPrice
                FROM book
                WHERE bookPrice >= 25000) book, bookSale
    WHERE book.bookNo = bookSale.bookNo
    GROUP BY book.bookNo, bookName, bookPrice
    ORDER BY "총 판매액" DESC;

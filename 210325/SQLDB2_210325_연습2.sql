    /*
        <연습 문제>
        1. 도서 테이블에서 가격 순으로 내림차순 정렬하여,  도서명, 저자, 가격 출력 (가격이 같으면 저자 순으로 오름차순 정렬)
        2. 도서 테이블에서 저자에 '길동'이 들어가는 도서의 총 재고 수량 계산하여 출력
        3. 도서 테이블에서 ‘서울 출판사' 도서 중 최고가와 최저가 출력 
        4. 도서 테이블에서 출판사별로 총 재고수량과 평균 재고 수량 계산하여 출력 (‘총 재고 수량’으로 내림차순 정렬)
        5. 도서판매 테이블에서 고객별로 ‘총 주문 수량’과 ‘총 주문 건수’ 출력. 단 주문 건수가 2이상인 고객만 해당
    */
    
       -- 1. 도서 테이블에서 가격 순으로 내림차순 정렬하여,  도서명, 저자, 가격 출력 (가격이 같으면 저자 순으로 오름차순 정렬)
            SELECT bookName, bookAuthor, bookPrice
            FROM book
            ORDER BY bookPrice DESC, bookAuthor;
            
            
       -- 2. 도서 테이블에서 저자에 '길동'이 들어가는 도서의 총 재고 수량 계산하여 출력
            SELECT SUM(bookStock) AS "총 재고 수량"
            FROM book
            WHERE bookAuthor LIKE '%길동%';
            
            
            SELECT * FROM PUBLISHER;
       -- 3. 도서 테이블에서 ‘서울 출판사' 도서 중 최고가와 최저가 출력 -> 서울 출판사는 코드 1번
            SELECT MAX(bookPrice) AS "최고가", MIN(bookPrice) AS "최저가"
            FROM book
            WHERE pubNo = '1';
            
            
       -- 4. 도서 테이블에서 출판사별로 총 재고수량과 평균 재고 수량 계산하여 출력 (‘총 재고 수량’으로 내림차순 정렬)
            SELECT SUM(bookStock) AS "총 재고 수량", AVG(bookStock) AS "평균 재고 수량"
            FROM book
            GROUP BY pubNo
            ORDER BY "총 재고 수량" DESC;
            
    
        -- 정수로 표현 : ROUND() 함수 사용        
            SELECT SUM(bookStock) AS "총 재고 수량", ROUND(AVG(bookStock)) AS "평균 재고 수량"
            FROM book
            GROUP BY pubNo
            ORDER BY "총 재고 수량" DESC;
            
            
        -- 소수 둘째 자리까지 출력
            SELECT SUM(bookStock) AS "총 재고 수량", ROUND(AVG(bookStock), 2) AS "평균 재고 수량"
            FROM book
            GROUP BY pubNo
            ORDER BY "총 재고 수량" DESC;
            
       -- 5. 도서판매 테이블에서 고객별로 ‘총 주문 수량’과 ‘총 주문 건수’ 출력. 단 주문 건수가 2이상인 고객만 해당
            SELECT SUM(bsQty) AS "총 주문 수량", COUNT(bsQty) AS "총 주문 건수"
            FROM bookSale
            GROUP BY clientNo
            HAVING COUNT(*) >= 2;

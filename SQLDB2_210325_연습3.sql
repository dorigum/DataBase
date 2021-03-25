     /*
        <연습 문제>
        1. 모든 도서에 대하여 도서의 도서번호, 도서명, 출판사명 출력
        2. ‘서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 출력 (출판사명 사용)
        3. '정보출판사'에서 출간한 도서 중 판매된 도서의 도서명 출력 (중복된 경우 한 번만 출력) (출판사명 사용)
        4. 도서가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서가격, 주문수량 출력
        5. '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력 (고객명으로 오름차순 정렬)
        6. ‘도서출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 ‘총 매출액’ 출력
        7. ‘서울 출판사'에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서가격, 주문수량, 주문액 출력
        8. 판매된 도서에 대하여 도서별로 도서번호, 도서명, 총 주문 수량 출력
        9. 판매된 도서에 대하여 고객별로 고객명, 총구매액 출력 ( 총구매액이 100,000원 이상인 경우만 해당)
        10. 판매된 도서 중 ＇도서출판 강남'에서 출간한 도서에 대하여 고객명, 주문일, 도서명, 주문수량, 출판사명 출력 (고객명으로 오름차순 정렬)
     */
     
     -- 1. 모든 도서에 대하여 도서의 도서번호, 도서명, 출판사명 출력
        SELECT B.bookNo, B.bookName, P.pubName
        FROM publisher P
            INNER JOIN book B ON B.pubNo = P.pubNo;
            
            
            
     -- 2. ‘서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 출력 (출판사명 사용)
        SELECT B.bookName, B.bookAuthor, P.pubName
        FROM publisher P
            INNER JOIN book B ON B.pubNo = P.pubNo
        WHERE P.pubName = '서울 출판사';
        
        
        
     -- 3. '정보출판사'에서 출간한 도서 중 판매된 도서의 도서명 출력 (중복된 경우 한 번만 출력) (출판사명 사용)
        SELECT DISTINCT B.bookName
        FROM publisher P
            INNER JOIN book B ON B.pubNo = P.pubNo
        WHERE P.pubName = '정보출판사';
        
        
        
     -- 4. 도서가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서가격, 주문수량 출력
        SELECT C.clientName, B.bookName, B.bookPrice, BS.bsQty
        FROM client C
            INNER JOIN bookSale BS ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        WHERE B.bookPrice >= 30000;
     
     
     
     -- 5. '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력 (고객명으로 오름차순 정렬)
        SELECT B.bookName, C.clientName, C.clientGender, C.clientAddress
        FROM client C
            INNER JOIN bookSale BS ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        WHERE B.bookName = '안드로이드 프로그래밍'
        ORDER BY C.clientName;
        
        
        
     -- 6. ‘도서출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 ‘총 매출액’ 출력
        SELECT B.bookPrice * BS.bsQty AS "총 매출액"
        FROM book B
            INNER JOIN bookSale BS ON B.bookNo = BS.bookNo
            INNER JOIN publisher P ON P.pubNo = B.pubNo
        WHERE P.pubName = '도서출판 강남';
        
        
        
     -- 7. ‘서울 출판사'에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서가격, 주문수량, 주문액 출력
        SELECT BS.bsDate, P.pubName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "주문액"
        FROM book B
            INNER JOIN bookSale BS ON B.bookNo = BS.bookNo
            INNER JOIN publisher P ON P.pubNo = B.pubNo
        WHERE P.pubName = '서울 출판사';
        
        
        
     -- 8. 판매된 도서에 대하여 도서별로 도서번호, 도서명, 총 주문 수량 출력
        SELECT B.bookNo, B.bookName, SUM(BS.bsQty) AS "총 주문 수량"
        FROM bookSale BS
            INNER JOIN book B ON B.bookNo = BS.bookNo
        GROUP BY B.bookNo, B.bookName;
        
     
     
     -- 9. 판매된 도서에 대하여 고객별로 고객명, 총구매액 출력 ( 총구매액이 100,000원 이상인 경우만 해당)
        SELECT C.clientName, SUM(B.bookPrice * BS.bsQty) AS "총 구매액"
        FROM bookSale BS
            INNER JOIN client C ON  C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        GROUP BY C.clientName
        HAVING SUM(B.bookPrice * BS.bsQty) >= 100000;



     -- 10. 판매된 도서 중 ＇도서출판 강남'에서 출간한 도서에 대하여 고객명, 주문일, 도서명, 주문수량, 출판사명 출력 (고객명으로 오름차순 정렬)
        SELECT C.clientName, BS.bsDate, B.bookName, BS.bsQty, P.pubName
        FROM client C
            INNER JOIN bookSale BS ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
            INNER JOIN publisher P ON B.pubNo = P.pubNo
        WHERE P.pubName = '도서출판 강남'
        ORDER BY C.clientName;

    /*
        조인 (JOIN)
            - 여러 개의 테이블을 결합하여 조건에 맞는 행 검색
            
        조인의 종류
            - INNER JOIN (내부 조인)
                - 공통되는 열(속성)이 있을 때 사용
                - 공통 속성의 속성 값이 동일한 튜플만 반환
                - 예 : 상품을 주문한 적이 있는 고객 조회
                
            - OUTER JOIN (외부 조인)
                - 공통되는 열(속성)이 없을 때
                - 공통된 속성을 매개로 하는 정보가 없더라도, 버리지 않고 연상의 결과를 릴레이션에 표시
                - 예 : 주문하지 않은 고객도 조회
    */
    
    
    -- 한번이라도 도서를 주문한 적이 있는 고객 조회
        SELECT * FROM client
            INNER JOIN bookSale
            ON client.clientNo = bookSale.clientNo;
            
    
    -- 필요한 열만 추출
    -- 테이블명 대신 별칭(Alias) 사용
    -- 한번이라도 도서를 주문한 적이 있는 고객의
    -- 고객번호와 고객명 출력
        SELECT C.clientNo, C.clientName
        FROM client C
            INNER JOIN bookSale BS
            ON C.clientNo = BS.clientNo;
            
            
    -- 한번이라도 도서를 주문한 적이 있는 고객의
    -- 고객번호와 고객명 출력
    -- 중복되는 행은 한번만 출력 (UNIQUE)
    -- 고객번호를 기준으로 오름차순 정렬 (ORDER BY)
        SELECT UNIQUE C.clientNo, C.clientName
        FROM client C
            INNER JOIN bookSale BS
            ON C.clientNo = BS.clientNo
        ORDER BY C.clientNo;
        
        
    /*    
        3개의 테이블 결합 : 기본키 = 외래키 조건을 2개 지정
        book (bookNo)
        client (clientNo)
        bookSale (bsNo, bookNo, clientNo)
    */
    
    -- 주문된 도서에 대하여 도서를 주문한 고객명과 도서명을 출력
    SELECT C.clientName, B.bookName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo;
        
        SELECT C.clientName, B.bookName
        FROM client C, book B, bookSale BS
        WHERE C.clientNo = BS.clientNo AND B.bookNo = BS.bookNo;
      
        
    -- 도서를 주문한 고객의 고객정보, 주문정보 출력, 도서정보 출력
    -- 주문번호, 주문일, 고객번호, 고객명, 도서명, 주문수량
    -- 주문번호로 오름차순 정리
        SELECT C.clientNo, C.clientName, B.bookName, BS.bsNo, BS.bsDate, BS.bsQty
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        ORDER BY BS.bsNo;
        
    
    -- 고객별로 총 주문 수량 계산해서 (GROUP BY)
    -- 고객번호, 고객명, 주문수량 출력 (SUM())
    -- 총 주문수량 기준 내림차순 정렬 (ORDER BY...DESC)
        SELECT C.clientNo, C.clientName, SUM(BS.bsQty) AS "총 주문 수량"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
        GROUP BY C.clientNo, C.clientName -- C.clientNo 다음에 C.clientName 을 꼭 붙여줘야 오류 발생X
        ORDER BY "총 주문 수량" DESC;
        
        
    -- 고객번호 출력하지 않고 고객명만 출력 가능
        SELECT C.clientName, SUM(BS.bsQty) AS "총 주문 수량"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
        GROUP BY C.clientNo, C.clientName
        ORDER BY "총 주문 수량" DESC;
        
        
        SELECT C.clientName, SUM(BS.bsQty) AS "총 주문 수량"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
        GROUP BY C.clientName -- 서로 다른 고객인데 동일 그룹으로 묶일 수 있음
        ORDER BY "총 주문 수량" DESC;
       
        
    -- 주문된 도서의 주문일, 고객명, 도서명, 도서가격, 주문수량, 주문액 계산해서 출력
    -- 주문일 오름차순 정렬
        SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "주문액"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        ORDER BY BS.bsDate;
        
        
    -- 주문액 기준으로 내림차순 정렬
        SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "주문액"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        ORDER BY "주문액" DESC;
        
        
        
    -- WHERE 절 추가
    -- 2018년 ~ 현재까지 판매된 도서의 주문일, 고객명, 도서명, 도서가격, 주문수량, 주문액 출력
        SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "주문액"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        WHERE BS.bsDate >= '2020-01-01'
        ORDER BY "주문액" DESC;

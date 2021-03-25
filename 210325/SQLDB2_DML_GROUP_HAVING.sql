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

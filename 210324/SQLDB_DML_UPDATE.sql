
/*
    UPDATE 문
        - 특정 열의 값을 수정하는 명령어
        - 조건에 맞는 행을 찾아서 열의 값 수정
        - 조건 : WHERE
        
        형식 : UPDATE 테이블명 SET 열 = 값 WHERE 조건;
        예 : 상품번호가 5인 행의 상품명을 'UHD TV' 로 수정
        UPDATE product SET prdName = 'UHD TV' WHERE prdNo = '5';
*/


    -- 상품 테이블 조회
        SELECT * FROM PRODUCT;
        SELECT prdName, prdPrice FROM PRODUCT;

    -- 상품번호가 5인 행의 상품명을 'UHD TV'로 수정
        UPDATE product SET prdName = 'UHD TV' WHERE prdNo = '5';

    -- 상품명이 '그늘막 텐트' 인 것을 찾아서 가격을 50000원으로 변경
        UPDATE product SET prdPrice = 50000 WHERE prdName = '그늘막 텐트';


/*
    DELETE 문
        - 테이블에 있는 기존 행을 삭제
        
        형식 : DELETE FROM 테이블명 WHERE 조건;
        예 : 상품명 '그늘막 텐트' 인 행 삭제
        DELETE FROM product WHERE prdName = '그늘막 텐트';
        
        - 테이블의 모든 행 삭제
        DELETE FROM product;
*/

    -- 상품명 '그늘막 텐트' 인 행 삭제
            DELETE FROM product WHERE prdName = '그늘막 텐트';
        
        
        
    /* 연습 문제
        (1) book 테이블에 다음과 같이 행 삽입
            6   |   JAVA 프로그래밍  |   33000  |     2021-02-10  |   서울 출판사
            7   |   파이썬                  |   24000  |     2019-10-10  |   도서출판 강남
            
        (2) book 테이블에서 도서명이 '데이터베이스' 인 행의 가격을 22000으로 변경
        (3) book 테이블에서 발행일이 2015년도인 도서 삭제
    */
    
    SELECT * FROM BOOK;
    
    -- (1) book 테이블에 다음과 같이 행 삽입
    --     6   |   JAVA 프로그래밍  |   33000  |     2021-02-10  |   서울 출판사
    --     7   |   파이썬                  |   24000  |     2019-10-10  |   도서출판 강남
    
    INSERT INTO book
        VALUES ('6', 'JAVA 프로그래밍', 33000, '2021-02-10', '1');
    
    INSERT INTO book
        VALUES ('7', '파이썬', 24000, '2019-10-10', '2');
    
    
    -- (2) book 테이블에서 도서명이 '데이터베이스' 인 행의 가격을 22000으로 변경
    UPDATE book SET bookPrice = 22000 WHERE bookName = '데이터베이스';
    
    
    -- (3) book 테이블에서 발행일이 2015년도인 도서 삭제
    DELETE FROM book WHERE bookDate >= '2015-01-01' AND bookDate <= '2015-12-31';
    
    -- SUBSTR() 함수 사용
     DELETE FROM book WHERE SUBSTR(bookDate, 0, 4) = '2015';

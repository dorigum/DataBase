        /*
            book, publisher, client, bookSale
            새 사용자 생성 : KDYUSER2
            새 접속 생성 : SQLDB2
            
            4개의 텍스트 파일 IMPORT 해서 테이블 생성
            * 주의!! 순서 주의 ( 외래키 제약 조건 설정)
            
            데이터 타입
                - 숫자 : bookPrice, bookStock, bsQty
                - 날짜 : bsDate,clientBirth, bookDate
      */
        
        
        
    -- 기본키 설정
    ALTER TABLE book
        ADD CONSTRAINT PK_book_bookNo PRIMARY KEY (bookNo);
        
    ALTER TABLE bookSale
        ADD CONSTRAINT PK_bookSale_bsNo PRIMARY KEY (bsNo);
        
    ALTER TABLE client
        ADD CONSTRAINT PK_client_clientNo PRIMARY KEY (clientNo);
        
    ALTER TABLE publisher
        ADD CONSTRAINT PK_publisher_pubNo PRIMARY KEY (pubNo);
        
        
        
    -- 데이터 타입 수정
    -- book
    ALTER TABLE book MODIFY bookStock NUMBER(10);
    ALTER TABLE book MODIFY bookPrice NUMBER(10);
    ALTER TABLE book MODIFY bookDate DATE;
    
    -- bookSale
    ALTER TABLE bookSale MODIFY bsQty NUMBER(10);
    ALTER TABLE bookSale MODIFY bsDate DATE;
        
    -- client
    ALTER TABLE client MODIFY clientBirth DATE;
    
    
    
    -- 외래키 제약 조건 설정
    -- book
    ALTER TABLE book
        ADD CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo);    
    
    -- bookSale
    ALTER TABLE bookSale
        ADD CONSTRAINT FK_bookSale_book FOREIGN KEY (bookNo) REFERENCES book (bookNo);

    ALTER TABLE bookSale
        ADD CONSTRAINT FK_bookSale_client FOREIGN KEY (clientNo) REFERENCES client (clientNo);
        
        
        
    SELECT * FROM publisher;
    SELECT * FROM book;
    SELECT * FROM client;
    SELECT * FROM bookSale;
    
    
    
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
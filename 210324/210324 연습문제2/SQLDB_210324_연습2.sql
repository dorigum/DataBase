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
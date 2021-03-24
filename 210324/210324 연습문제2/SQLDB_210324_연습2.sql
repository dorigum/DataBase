        /*
            book, publisher, client, bookSale
            �� ����� ���� : KDYUSER2
            �� ���� ���� : SQLDB2
            
            4���� �ؽ�Ʈ ���� IMPORT �ؼ� ���̺� ����
            * ����!! ���� ���� ( �ܷ�Ű ���� ���� ����)
            
            ������ Ÿ��
                - ���� : bookPrice, bookStock, bsQty
                - ��¥ : bsDate,clientBirth, bookDate
      */
        
        
        
        
    
    -- �⺻Ű ����
    ALTER TABLE book
        ADD CONSTRAINT PK_book_bookNo PRIMARY KEY (bookNo);
        
    ALTER TABLE bookSale
        ADD CONSTRAINT PK_bookSale_bsNo PRIMARY KEY (bsNo);
        
    ALTER TABLE client
        ADD CONSTRAINT PK_client_clientNo PRIMARY KEY (clientNo);
        
    ALTER TABLE publisher
        ADD CONSTRAINT PK_publisher_pubNo PRIMARY KEY (pubNo);
        
        
        
    -- ������ Ÿ�� ����
    -- book
    ALTER TABLE book MODIFY bookStock NUMBER(10);
    ALTER TABLE book MODIFY bookPrice NUMBER(10);
    ALTER TABLE book MODIFY bookDate DATE;
    
    -- bookSale
    ALTER TABLE bookSale MODIFY bsQty NUMBER(10);
    ALTER TABLE bookSale MODIFY bsDate DATE;
        
    -- client
    ALTER TABLE client MODIFY clientBirth DATE;
    
    
    
    -- �ܷ�Ű ���� ���� ����
    -- book
    ALTER TABLE book
        ADD CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo);    
    
    -- bookSale
    ALTER TABLE bookSale
        ADD CONSTRAINT FK_bookSale_book FOREIGN KEY (bookNo) REFERENCES book (bookNo);

    ALTER TABLE bookSale
        ADD CONSTRAINT FK_bookSale_client FOREIGN KEY (clientNo) REFERENCES client (clientNo);
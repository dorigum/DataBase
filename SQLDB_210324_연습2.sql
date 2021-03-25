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
        
        
        
    SELECT * FROM publisher;
    SELECT * FROM book;
    SELECT * FROM client;
    SELECT * FROM bookSale;
    
    
    
    -- ������� ���ݸ� ���
    SELECT bookName, bookPrice FROM BOOK;
    
    -- ���ڸ� ���
    SELECT bookAuthor FROM book;
    
    
    -- �ߺ� ���� - DISTINCT
    -- �Ӽ����� �ߺ��Ǵ� ���� ������ �ѹ��� ���
     SELECT DISTINCT bookAuthor FROM book;
     
     
    -- �� (=, <, >, <=, >=, !=)
    
    -- ���ڰ� 'ȫ�浿' �� ������ ������, ���� ���
        SELECT bookName, bookAuthor FROM book WHERE bookAuthor = 'ȫ�浿';
    
    --������ 30000 �̻��� ������ ������, ����, ��� ���
        SELECT bookName, bookPrice, bookStock  FROM book WHERE bookPrice >= 30000;
    
    -- ��� 3~5 ������ ������ ������, ��� ���
        SELECT bookName, bookStock FROM book WHERE bookStock >= 3 AND bookStock <= 5;
        
        
    -- ���� ( BETWEEN A AND B)
        SELECT bookName, bookStock FROM book WHERE bookStock BETWEEN 3 AND 5;
        
        
    -- ����Ʈ�� ���� ���� (IN, NOT IN)
    
    -- ���ǻ� ���� '���� ���ǻ�' (pubNo = '1') �� '�������� ����' (pubNo = '2') �� ������
    -- ������, ���ǻ� ��ȣ ���
    -- (1)
        SELECT bookName, pubNo FROM book
        WHERE pubNo IN ('1', '2');
    -- (2)
        SELECT bookName, pubNo FROM book
        WHERE pubNo = '1' OR pubNo = '2';
        
        
    -- ���ǻ���� '�������� ����' (pubNo = '2') �� �ƴ� ������
    -- ������, ���ǻ��ȣ ���
        SELECT bookName, pubNo FROM book
        WHERE pubNo NOT IN ('2');
        
        
        
        SELECT * FROM client;
        
    -- NULL ���� ( IS NULL, IS NOT NULL);
        
    -- ��� ����, ��� ���
        SELECT clientName, clientHobby FROM client;
        
    -- ��̿� NULL ���� ��� �ִ� �ุ ���
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby IS NULL;
        
    -- ��̿� NULL ���� �ƴ� �ุ ���
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby IS NOT NULL;
        
    -- ��̿� ������ ��� �ִ� �ุ ���
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby = ' ';
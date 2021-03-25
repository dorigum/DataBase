        /*
            PIVOT() �Լ�
                - ROW ������ COLUMN ������ ����
                - �� ���� ���Ե� ���� ���� ���� ���� ��ȯ�Ͽ� ���̺� ��ȯ���� ȸ���ϰ� ���� ����
        */
        
        
        CREATE TABLE pivotTest(
            singer VARCHAR2(10),
            season VARCHAR2(10),
            amount NUMBER(3)
            );
            
        
        INSERT INTO pivotTest VALUES ('�����', '�ܿ�', 10);
        INSERT INTO pivotTest VALUES ('������', '����', 15);
        INSERT INTO pivotTest VALUES ('�����', '����', 25);
        INSERT INTO pivotTest VALUES ('�����', '�ܿ�', 4);
        INSERT INTO pivotTest VALUES ('�����', '��', 37);
        INSERT INTO pivotTest VALUES ('������', '��', 40);
        INSERT INTO pivotTest VALUES ('�����', '����', 14);
        INSERT INTO pivotTest VALUES ('�����', '�ܿ�', 22);
        INSERT INTO pivotTest VALUES ('������', '����', 64);
        
        
        SELECT * FROM pivotTest;
        
        
        SELECT * FROM pivotTest
            PIVOT(SUM(AMOUNT)
                FOR season
                IN ('��', '����', '����', '�ܿ�'));
                
                
    
    
    -- DELETE / DROP / TRUNCTE ���� �ӵ� Ȯ��
    
    -- 50�� ���� ������ ����
        CREATE TABLE bigTBL1 AS
        SELECT level AS bigID,
            ROUND(DBMS_RANDOM.VALUE(1, 500000), 0) AS numData
        FROM dual
        CONNECT BY level <= 500000;
        
        
        
        CREATE TABLE bigTBL2 AS
        SELECT level AS bigID,
        ROUND(DBMS_RANDOM.VALUE(1, 500000), 0) AS numData
        FROM dual
        CONNECT BY level <= 500000;
        
        
        
        CREATE TABLE bigTBL3 AS
        SELECT level AS bigID,
        ROUND(DBMS_RANDOM.VALUE(1, 500000), 0) AS numData
        FROM dual
        CONNECT BY level <= 500000;
        
        
        
        DELETE FROM bigTBL1; -- 68.644
        COMMIT;
        
        DROP TABLE bigTBL2; -- 0.129
        
        TRUNCATE TABLE bigTBL3; -- 0.132
        
        
        
        -- CONNECT BY ���� : �׽�Ʈ�� ���� ������ �����ؼ� ����� ��
            SELECT level
            FROM dual
            CONNECT BY level <= 20;
            
            
        -- LPAD() : ���ʿ������� �� ���̸�ŭ ������ ���ڿ��� ä��
        -- LPAD(��, ���ڿ�����, ä����)
            SELECT '2021��' || LPAD(level, 2, 0) || '��' AS no
            FROM dual
            CONNECT BY level <= 12;
            
            
       /*
            ���̺� ���� : �⺻Ű�� ���簡 �� ��!! (���� �� �⺻Ű �����ؾ� ��)
                - CREATE TABLE ... AS SELECT
                - CREATE TABLE �� ���̺�� AS SELECT ������ �� FROM ���� ���̺� [WHERE��]
        */
        
        -- book ���̺��� '2019-01-01' ������ �����͸� ����Ͽ� newBook ���̺� ����
        CREATE TABLE newBook AS
        SELECT * FROM book  WHERE bookDate >= '2019-01-01';
        
        SELECT * FROM newBook;
            
         ALTER TABLE newBook
            ADD CONSTRAINT PK_newBook_bookNo
            PRIMARY KEY (bookNo);
                
        
        -- newBook ������ ��� ����
        DELETE FROM newbook;
        
        
        -- �����ϴ� ���̺� �����͸� ���� (���̺� ���� ������ ���)
        INSERT INTO newbook SELECT * FROM book;
        
        
        -- ������ �ٸ� ���̺� �ϳ� ����
        CREATE TABLE newBook2 (
            bookNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            bookName VARCHAR2(40)
            );
            
            
      -- �����ϴ� ���̺� �����͸� ���� (���̺� ���� �ٸ� ���)
        INSERT INTO newBook2(bookNo, bookName)
        SELECT bookNo, bookName FROM book;
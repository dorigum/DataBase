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
        
        
        
        
    -- �� (AND, OR)
    
    -- ���ڰ� 'ȫ�浿' �̸鼭 ��� 3�� �̻��� ��� ���� ���
        SELECT * FROM book
        WHERE bookAuthor = 'ȫ�浿' AND bookStock >= 3;
    
    -- ���ڰ� 'ȫ�浿' �̰ų� '������' �� ��� ���� ���
        SELECT * FROM book
        WHERE bookAuthor = 'ȫ�浿' OR bookAuthor = '������';
        
        
        
    -- ���� ��Ī (LIKE)
    /*
        'ȫ%' : 'ȫ' ���� �����ϴ� ���ڿ� �˻�
        '%��%' : '��' �� �����ϴ� ���ڿ� ('��' ��, �ڿ� �ƹ� ���ڰ� �͵� ��)
        '%��' : '��' ���� ������ ���ڿ�
        '____' : 4���� ���ڷ� ������ ���ڿ� (���� ���� 1���� 1�� ����)
        
        % : 0�� �̻��� ���ڸ� ���� ���ڿ�
        _ : ���� ���� (�� ��ŭ�� ���ڷ� ����) (LIKE '__')
    */
    
    
    
    -- ���ǻ� ���̺��� ���ǻ�� '���ǻ�' �� ���Ե� ��� �� ���
        SELECT * FROM publisher
        WHERE pubName LIKE '%���ǻ�%';
    
    -- �� ���̺��� ����⵵�� 1990����� ��� �� ���
        SELECT * FROM client
        WHERE clientBirth LIKE '199%';
    
    -- �� ���̺��� �̸��� 4������ �� ���
        SELECT * FROM client
        WHERE clientName LIKE '____';
    
    -- ���� ���̺��� ������ '�ȵ���̵�' �� ���ԵǾ� ���� ���� ������ ������ ���
        SELECT bookName FROM book
        WHERE bookName NOT LIKE ('%�ȵ���̵�%');
        
        


    /*
        ORDER BY
            - Ư�� ���� ���� �������� ���� ��� ����
            - ASC : �������� (����Ʈ : ���� ����)
            - DESC : ��������
    */
    
    -- ������ ������ ���� �˻� ( �⺻ : �������� (ASC ���� ����))
        SELECT * FROM book
        ORDER BY bookName;
        
        SELECT * FROM book
        ORDER BY bookName ASC;
        
    -- ������ ������ �������� �˻� (DESC)
        SELECT * FROM book
        ORDER BY bookName DESC;
        
    -- ���� ���̺��� ��� ������ �������� �������� �����Ͽ�
    -- ������, ����, ��� ���
        SELECT bookName, bookauthor, bookstock  FROM book
        ORDER BY bookstock DESC;
        
        
    -- 2�� ���� (1�� ���� ������� ������ ���, �ٽ� 2�� ���� ����)
    -- ���� ���̺��� ��� ������ �������� �������� �����Ͽ�
    -- ������, ����, ��� ���
    -- ��� ������ ������ ���, ���ڸ����� �������� 2�� ����
    
    -- ASC �Է�
        SELECT bookName, bookauthor, bookstock  FROM book
        ORDER BY bookstock DESC, bookauthor ASC;
        
    -- ASC ���� (���� ����, ����� ����)
        SELECT bookName, bookauthor, bookstock  FROM book
        ORDER BY bookstock DESC, bookauthor;
        
    
    
    
    
    /*
        ���� �Լ�
        - SUM() : �հ�
        - AVG() : ���
        - COUNT() : ���õ� ���� ���� �� (NULL���� ����)
        - COUNT(*) : ��ü ���� ��
        - MAX() : �ִ밪
        - MIN() : �ּҰ�
    */
    
    
    -- SUM() : �հ�
    
    -- ���� ���̺��� �� ��� ���� ����ؼ� ���
        SELECT SUM(bookstock) FROM book;
        
        
    -- �� �̸� 'sum of bookStock' ����
        SELECT SUM(bookstock) AS "sum of bookStock"
        FROM book;
        
        
    -- �� �̸� �ѱ۵� ����
        SELECT SUM(bookstock) AS "�� ���"
        FROM book;
        
        
    -- ���� �Ǹ� ���̺���
    -- ����ȣ 2�� ȣ���ΰ� �ֹ��� ������ �� �ֹ����� ����Ͽ� ���
        SELECT SUM(bsQty) AS "�� �ֹ� ����"
        FROM booksale
        WHERE clientNo = '2';
        
        SELECT clientNo, bsQty FROM booksale;
        
        
    -- ���� �Ǹ� ���̺��� �ִ�/�ּ� �ֹ��� ���
        SELECT MAX(bsQty) AS "�ִ� �ֹ���", MIN(bsQty) AS "�ּ� �ֹ���"
        FROM booksale;
        
        
    -- ���� ���̺��� ������ '���� �Ѿ�', '��� ����', '�ְ�', '������' ���
        SELECT SUM(bookprice) AS "���� �Ѿ�",
                        AVG(bookprice) AS "��� ����",
                        MAX(bookprice) AS "�ְ�",
                        MIN(bookprice) AS "������"
        FROM book;
        
        
    -- �� �̸��� ������ ��� ���� ������ "" ��� ��
        SELECT SUM(bookprice) AS "���� �Ѿ�",
                         AVG(bookprice) AS ��հ���,
                         MAX(bookprice) "�ְ�",
                         MIN(bookprice) "������"
        FROM book;
        
        
        
        
    -- ���� �Ǹ� ���̺��� ���� �Ǹ� �Ǽ� ��� (��� ���� ��)
        SELECT COUNT(*) AS "�� �Ǹ� �Ǽ�"
        FROM bookSale;
        
    
    -- �� ���̺��� �� �� �� (��� ���� ��)
        SELECT COUNT(*) AS "�� ����"
        FROM client;
        
        
    -- �� ���̺��� �� ��� ���� ��� (NULL ���� ����)
        SELECT COUNT(clientHobby) AS ���
        FROM client;
        
        SELECT clientHobby FROM client;
        
        
        
        
        
        /*
            GROUP BY �� �̸�
                - �׷� ���Ǹ� ����� �� ���
                - Ư�� ���� �׷�ȭ�� ��, �� �׷쿡 ���� �� �྿ ���� ��� ����
                - ����!! (SELECT ���� �� �̸��� GROUP BY���� ����� �� �̸��� ���� �Լ��� ���� �� �ִ�)
        */
        
        SELECT bookNo, SUM(bsQty) AS "�ֹ��� �հ�"
        FROM bookSale
        GROUP BY bookNo;
        
        
        -- GROUP BY ������ ����
        SELECT bookNo, SUM(bsQty) AS "�ֹ��� �հ�"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY bookNo;
        
        -- ù��° ��
        SELECT bookNo, SUM(bsQty) AS "�ֹ��� �հ�"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY 1;
        
        -- �ι�° ��
        SELECT bookNo, SUM(bsQty) AS "�ֹ��� �հ�"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY 2;
        
        -- ���� �߰��� �� �̸� ��� ����
        SELECT bookNo, SUM(bsQty) AS "�ֹ��� �հ�"
        FROM bookSale
        GROUP BY bookNo
        ORDER BY "�ֹ��� �հ�";
        
        
        
        /*
            HAVING �˻� ����
                - GROUP BY ���� ���� ������ �׷쿡 ���� ������ ���� ���
                - SUM(), AVG(), MAX(), MIN(), COUNT() �� ���� �Լ��� �Բ� ���
        */
        
        
        -- ���� ���̺��� ������ 25000 �̻��� ������ ���ؼ�
        -- ���ǻ� ����(�׷�ȭ) ���� �� �հ� ���. ��, ���� �� �հ谡 2 �̻��� ��츸 ���
        SELECT pubNo, COUNT(*) AS "���� �� �հ�"
        FROM book
        WHERE bookPrice >= 25000
        GROUP BY pubNo
        HAVING COUNT(*) >= 2;
        
        
        
        
        
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
            
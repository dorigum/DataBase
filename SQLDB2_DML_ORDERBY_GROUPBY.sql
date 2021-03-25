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
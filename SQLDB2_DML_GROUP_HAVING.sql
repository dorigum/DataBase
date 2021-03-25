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
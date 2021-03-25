    /*
        <���� ����>
        1. ���� ���̺��� ���� ������ �������� �����Ͽ�,  ������, ����, ���� ��� (������ ������ ���� ������ �������� ����)
        2. ���� ���̺��� ���ڿ� '�浿'�� ���� ������ �� ��� ���� ����Ͽ� ���
        3. ���� ���̺��� ������ ���ǻ�' ���� �� �ְ��� ������ ��� 
        4. ���� ���̺��� ���ǻ纰�� �� �������� ��� ��� ���� ����Ͽ� ��� (���� ��� ���������� �������� ����)
        5. �����Ǹ� ���̺��� ������ ���� �ֹ� �������� ���� �ֹ� �Ǽ��� ���. �� �ֹ� �Ǽ��� 2�̻��� ���� �ش�
    */
    
       -- 1. ���� ���̺��� ���� ������ �������� �����Ͽ�,  ������, ����, ���� ��� (������ ������ ���� ������ �������� ����)
            SELECT bookName, bookAuthor, bookPrice
            FROM book
            ORDER BY bookPrice DESC, bookAuthor;
            
            
       -- 2. ���� ���̺��� ���ڿ� '�浿'�� ���� ������ �� ��� ���� ����Ͽ� ���
            SELECT SUM(bookStock) AS "�� ��� ����"
            FROM book
            WHERE bookAuthor LIKE '%�浿%';
            
            
            SELECT * FROM PUBLISHER;
       -- 3. ���� ���̺��� ������ ���ǻ�' ���� �� �ְ��� ������ ��� -> ���� ���ǻ�� �ڵ� 1��
            SELECT MAX(bookPrice) AS "�ְ�", MIN(bookPrice) AS "������"
            FROM book
            WHERE pubNo = '1';
            
            
       -- 4. ���� ���̺��� ���ǻ纰�� �� �������� ��� ��� ���� ����Ͽ� ��� (���� ��� ���������� �������� ����)
            SELECT SUM(bookStock) AS "�� ��� ����", AVG(bookStock) AS "��� ��� ����"
            FROM book
            GROUP BY pubNo
            ORDER BY "�� ��� ����" DESC;
            
    
        -- ������ ǥ�� : ROUND() �Լ� ���        
            SELECT SUM(bookStock) AS "�� ��� ����", ROUND(AVG(bookStock)) AS "��� ��� ����"
            FROM book
            GROUP BY pubNo
            ORDER BY "�� ��� ����" DESC;
            
            
        -- �Ҽ� ��° �ڸ����� ���
            SELECT SUM(bookStock) AS "�� ��� ����", ROUND(AVG(bookStock), 2) AS "��� ��� ����"
            FROM book
            GROUP BY pubNo
            ORDER BY "�� ��� ����" DESC;
            
       -- 5. �����Ǹ� ���̺��� ������ ���� �ֹ� �������� ���� �ֹ� �Ǽ��� ���. �� �ֹ� �Ǽ��� 2�̻��� ���� �ش�
            SELECT SUM(bsQty) AS "�� �ֹ� ����", COUNT(bsQty) AS "�� �ֹ� �Ǽ�"
            FROM bookSale
            GROUP BY clientNo
            HAVING COUNT(*) >= 2;
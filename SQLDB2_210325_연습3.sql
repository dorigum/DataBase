     /*
        <���� ����>
        1. ��� ������ ���Ͽ� ������ ������ȣ, ������, ���ǻ�� ���
        2. ������ ���ǻ�'���� �Ⱓ�� ������ ������, ���ڸ�, ���ǻ�� ��� (���ǻ�� ���)
        3. '�������ǻ�'���� �Ⱓ�� ���� �� �Ǹŵ� ������ ������ ��� (�ߺ��� ��� �� ���� ���) (���ǻ�� ���)
        4. ���������� 30,000�� �̻��� ������ �ֹ��� ���� ����, ������, ��������, �ֹ����� ���
        5. '�ȵ���̵� ���α׷���' ������ ������ ���� ���Ͽ� ������, ����, ����, �ּ� ��� (�������� �������� ����)
        6. ���������� ����'���� �Ⱓ�� ���� �� �Ǹŵ� ������ ���Ͽ� ���� ����ס� ���
        7. ������ ���ǻ�'���� �Ⱓ�� ������ ���Ͽ� �Ǹ���, ���ǻ��, ������, ��������, �ֹ�����, �ֹ��� ���
        8. �Ǹŵ� ������ ���Ͽ� �������� ������ȣ, ������, �� �ֹ� ���� ���
        9. �Ǹŵ� ������ ���Ͽ� ������ ����, �ѱ��ž� ��� ( �ѱ��ž��� 100,000�� �̻��� ��츸 �ش�)
        10. �Ǹŵ� ���� �� ���������� ����'���� �Ⱓ�� ������ ���Ͽ� ����, �ֹ���, ������, �ֹ�����, ���ǻ�� ��� (�������� �������� ����)
     */
     
     -- 1. ��� ������ ���Ͽ� ������ ������ȣ, ������, ���ǻ�� ���
        SELECT B.bookNo, B.bookName, P.pubName
        FROM publisher P
            INNER JOIN book B ON B.pubNo = P.pubNo;
            
            
            
     -- 2. ������ ���ǻ�'���� �Ⱓ�� ������ ������, ���ڸ�, ���ǻ�� ��� (���ǻ�� ���)
        SELECT B.bookName, B.bookAuthor, P.pubName
        FROM publisher P
            INNER JOIN book B ON B.pubNo = P.pubNo
        WHERE P.pubName = '���� ���ǻ�';
        
        
        
     -- 3. '�������ǻ�'���� �Ⱓ�� ���� �� �Ǹŵ� ������ ������ ��� (�ߺ��� ��� �� ���� ���) (���ǻ�� ���)
        SELECT DISTINCT B.bookName
        FROM publisher P
            INNER JOIN book B ON B.pubNo = P.pubNo
        WHERE P.pubName = '�������ǻ�';
        
        
        
     -- 4. ���������� 30,000�� �̻��� ������ �ֹ��� ���� ����, ������, ��������, �ֹ����� ���
        SELECT C.clientName, B.bookName, B.bookPrice, BS.bsQty
        FROM client C
            INNER JOIN bookSale BS ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        WHERE B.bookPrice >= 30000;
     
     
     
     -- 5. '�ȵ���̵� ���α׷���' ������ ������ ���� ���Ͽ� ������, ����, ����, �ּ� ��� (�������� �������� ����)
        SELECT B.bookName, C.clientName, C.clientGender, C.clientAddress
        FROM client C
            INNER JOIN bookSale BS ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        WHERE B.bookName = '�ȵ���̵� ���α׷���'
        ORDER BY C.clientName;
        
        
        
     -- 6. ���������� ����'���� �Ⱓ�� ���� �� �Ǹŵ� ������ ���Ͽ� ���� ����ס� ���
        SELECT B.bookPrice * BS.bsQty AS "�� �����"
        FROM book B
            INNER JOIN bookSale BS ON B.bookNo = BS.bookNo
            INNER JOIN publisher P ON P.pubNo = B.pubNo
        WHERE P.pubName = '�������� ����';
        
        
        
     -- 7. ������ ���ǻ�'���� �Ⱓ�� ������ ���Ͽ� �Ǹ���, ���ǻ��, ������, ��������, �ֹ�����, �ֹ��� ���
        SELECT BS.bsDate, P.pubName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "�ֹ���"
        FROM book B
            INNER JOIN bookSale BS ON B.bookNo = BS.bookNo
            INNER JOIN publisher P ON P.pubNo = B.pubNo
        WHERE P.pubName = '���� ���ǻ�';
        
        
        
     -- 8. �Ǹŵ� ������ ���Ͽ� �������� ������ȣ, ������, �� �ֹ� ���� ���
        SELECT B.bookNo, B.bookName, SUM(BS.bsQty) AS "�� �ֹ� ����"
        FROM bookSale BS
            INNER JOIN book B ON B.bookNo = BS.bookNo
        GROUP BY B.bookNo, B.bookName;
        
     
     
     -- 9. �Ǹŵ� ������ ���Ͽ� ������ ����, �ѱ��ž� ��� ( �ѱ��ž��� 100,000�� �̻��� ��츸 �ش�)
        SELECT C.clientName, SUM(B.bookPrice * BS.bsQty) AS "�� ���ž�"
        FROM bookSale BS
            INNER JOIN client C ON  C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        GROUP BY C.clientName
        HAVING SUM(B.bookPrice * BS.bsQty) >= 100000;



     -- 10. �Ǹŵ� ���� �� ���������� ����'���� �Ⱓ�� ������ ���Ͽ� ����, �ֹ���, ������, �ֹ�����, ���ǻ�� ��� (�������� �������� ����)
        SELECT C.clientName, BS.bsDate, B.bookName, BS.bsQty, P.pubName
        FROM client C
            INNER JOIN bookSale BS ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
            INNER JOIN publisher P ON B.pubNo = P.pubNo
        WHERE P.pubName = '�������� ����'
        ORDER BY C.clientName;
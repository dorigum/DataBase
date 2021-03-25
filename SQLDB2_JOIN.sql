
    /*
        ���� (JOIN)
            - ���� ���� ���̺��� �����Ͽ� ���ǿ� �´� �� �˻�
            
        ������ ����
            - INNER JOIN (���� ����)
                - ����Ǵ� ��(�Ӽ�)�� ���� �� ���
                - ���� �Ӽ��� �Ӽ� ���� ������ Ʃ�ø� ��ȯ
                - �� : ��ǰ�� �ֹ��� ���� �ִ� �� ��ȸ
                
            - OUTER JOIN (�ܺ� ����)
                - ����Ǵ� ��(�Ӽ�)�� ���� ��
                - ����� �Ӽ��� �Ű��� �ϴ� ������ ������, ������ �ʰ� ������ ����� �����̼ǿ� ǥ��
                - �� : �ֹ����� ���� ���� ��ȸ
    */
    
    
    -- �ѹ��̶� ������ �ֹ��� ���� �ִ� �� ��ȸ
        SELECT * FROM client
            INNER JOIN bookSale
            ON client.clientNo = bookSale.clientNo;
            
    
    -- �ʿ��� ���� ����
    -- ���̺�� ��� ��Ī(Alias) ���
    -- �ѹ��̶� ������ �ֹ��� ���� �ִ� ����
    -- ����ȣ�� ���� ���
        SELECT C.clientNo, C.clientName
        FROM client C
            INNER JOIN bookSale BS
            ON C.clientNo = BS.clientNo;
            
            
    -- �ѹ��̶� ������ �ֹ��� ���� �ִ� ����
    -- ����ȣ�� ���� ���
    -- �ߺ��Ǵ� ���� �ѹ��� ��� (UNIQUE)
    -- ����ȣ�� �������� �������� ���� (ORDER BY)
        SELECT UNIQUE C.clientNo, C.clientName
        FROM client C
            INNER JOIN bookSale BS
            ON C.clientNo = BS.clientNo
        ORDER BY C.clientNo;
        
        
    /*    
        3���� ���̺� ���� : �⺻Ű = �ܷ�Ű ������ 2�� ����
        book (bookNo)
        client (clientNo)
        bookSale (bsNo, bookNo, clientNo)
    */
    
    -- �ֹ��� ������ ���Ͽ� ������ �ֹ��� ����� �������� ���
    SELECT C.clientName, B.bookName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo;
        
        SELECT C.clientName, B.bookName
        FROM client C, book B, bookSale BS
        WHERE C.clientNo = BS.clientNo AND B.bookNo = BS.bookNo;
      
        
    -- ������ �ֹ��� ���� ������, �ֹ����� ���, �������� ���
    -- �ֹ���ȣ, �ֹ���, ����ȣ, ����, ������, �ֹ�����
    -- �ֹ���ȣ�� �������� ����
        SELECT C.clientNo, C.clientName, B.bookName, BS.bsNo, BS.bsDate, BS.bsQty
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        ORDER BY BS.bsNo;
        
    
    -- ������ �� �ֹ� ���� ����ؼ� (GROUP BY)
    -- ����ȣ, ����, �ֹ����� ��� (SUM())
    -- �� �ֹ����� ���� �������� ���� (ORDER BY...DESC)
        SELECT C.clientNo, C.clientName, SUM(BS.bsQty) AS "�� �ֹ� ����"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
        GROUP BY C.clientNo, C.clientName -- C.clientNo ������ C.clientName �� �� �ٿ���� ���� �߻�X
        ORDER BY "�� �ֹ� ����" DESC;
        
        
    -- ����ȣ ������� �ʰ� ���� ��� ����
        SELECT C.clientName, SUM(BS.bsQty) AS "�� �ֹ� ����"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
        GROUP BY C.clientNo, C.clientName
        ORDER BY "�� �ֹ� ����" DESC;
        
        
        SELECT C.clientName, SUM(BS.bsQty) AS "�� �ֹ� ����"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
        GROUP BY C.clientName -- ���� �ٸ� ���ε� ���� �׷����� ���� �� ����
        ORDER BY "�� �ֹ� ����" DESC;
       
        
    -- �ֹ��� ������ �ֹ���, ����, ������, ��������, �ֹ�����, �ֹ��� ����ؼ� ���
    -- �ֹ��� �������� ����
        SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "�ֹ���"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        ORDER BY BS.bsDate;
        
        
    -- �ֹ��� �������� �������� ����
        SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "�ֹ���"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        ORDER BY "�ֹ���" DESC;
        
        
        
    -- WHERE �� �߰�
    -- 2018�� ~ ������� �Ǹŵ� ������ �ֹ���, ����, ������, ��������, �ֹ�����, �ֹ��� ���
        SELECT BS.bsDate, C.clientName, B.bookName, B.bookPrice, BS.bsQty, B.bookPrice * BS.bsQty AS "�ֹ���"
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        WHERE BS.bsDate >= '2020-01-01'
        ORDER BY "�ֹ���" DESC;
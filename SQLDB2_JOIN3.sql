
    -- �� ȣ������ �ֹ����� ��ȸ
    -- 1. client ���̺��� 'ȣ����' �� clientNo�� ã�Ƽ�
    -- 2. bookSale ���̺��� �� clientNo�� �ش�Ǵ� ������ ����
    -- 3. �ֹ���, �ֹ����� ���
    
    SELECT bsDate, bsQty
    FROM bookSale
    WHERE clientNo = ( SELECT clientNo
                                    FROM client
                                    WHERE clientName = 'ȣ����');
                                    
                                    
    -- �� ȣ���ΰ� �ֹ��� �� �ֹ� ���� ���
    SELECT SUM(bsQty) AS "�� �ֹ� ����"
    FROM bookSale
    WHERE clientNo = ( SELECT clientNo
                                    FROM client
                                    WHERE clientName = 'ȣ����');
                                    
                                    
    -- ���� ��� ������ ������� ���� ���
    SELECT bookName, bookPrice
    FROM book
    WHERE bookPrice = ( SELECT MAX(bookPrice)
                                        FROM book);
                                        
                                        
    -- ������ ��� ���ݺ��� ��� ������ ������, ���� ���
    -- ���� : ��� ���� ����
    SELECT AVG(bookPrice) AS "��� ���� ����"
    FROM book;
    
    SELECT bookName, bookPrice
    FROM book
    WHERE bookPrice > ( SELECT AVG(bookPrice) AS "��� ���� ����"
                                        FROM book);
                                        
                                        
    -- �������ǻ翡�� �Ⱓ�� ������ ������ ���� �ִ� ���� ���
    -- ���� ���
                                        --������ ������ �� �ִ�
                                                                            -- ���ǻ��� ����
                                                                                                        -- �������ǻ�
    SELECT clientName
    FROM client
    WHERE clientNo IN (SELECT clientNo
                                        FROM bookSale
                                        WHERE bookNo IN ( SELECT bookNo
                                                                            FROM book
                                                                            WHERE pubNo IN (SELECT pubNo
                                                                                                            FROM publisher
                                                                                                            WHERE pubName = '�������ǻ�')));
                                                                                                            



    -- �ѹ��� �ֹ��� ���� ���� ���� ����ȣ, ���� ���
    SELECT clientNo, clientName
    FROM client
    WHERE clientNo NOT IN (SELECT clientNo
                                                FROM bookSale);
                          
                                                
    SELECT clientNo, clientName
    FROM client
    WHERE NOT EXISTS (SELECT clientNo
                                FROM bookSale
                                WHERE client.clientNo = bookSale.clientNo);                                                                                                                   
                                                
                                                
    SELECT clientNo, clientName
    FROM client
    WHERE EXISTS (SELECT clientNo
                                FROM bookSale
                                WHERE client.clientNo = bookSale.clientNo);
                                
    -- NULL�� ���, IN�� EXISTS ����
    SELECT clientHobby FROM client;
    
    -- EXISTS : ���� ���� ����� NULL�� ����
    -- NULL�� �����Ͽ� ��� clientNo ���
    SELECT clientNo
    FROM client
    WHERE EXISTS (SELECT clientHobby
                                FROM client);
                                
   -- IN : ���� ���� ����� NULL�� ���Ե��� X
   -- NULL���� ���� �ʴ� clientNo�� ���
    SELECT clientNo
    FROM client
    WHERE clientHobby IN (SELECT clientHobby
                                FROM client);
                                
    
    -- ALL : �˻� ������ ���� ������ ����� ��� ���� �����ϸ� ���� �Ǵ� ������
    -- ���� > ALL (���� ���� ���)
    -- 2�� ���� �ֹ��� ������ �ְ� �ֹ��������� �� ���� ������ ������ ��
    -- 2�� ���� �ֹ��� ��� �ֹ����� �߻��� �ֹ��������� �� ���� ������ ������ ��
    -- ALL ���
    SELECT clientNo, bsNo, bsQty
    FROM bookSale
    WHERE bsQty > ALL (SELECT bsQty
                                        FROM bookSale
                                        WHERE clientNo = '2');
                                         
    SELECT * FROM bookSale;
    
    -- ANY ���
    SELECT clientNo, bsNo, bsQty
    FROM bookSale
    WHERE bsQty > ANY (SELECT bsQty
                                        FROM bookSale
                                        WHERE clientNo = '2');
                                        
      
                                        
    /*
        ���� ���� ����
            - ��Į�� ���� ���� : SELECT �� ��ġ / ���� �� ��ȯ
            - �ζ��� �� : FROM �� ��ġ / ����� ��(���� ���̺�) ���·� ��ȯ
            - ��ø ���� ���� : WHERE �� ��ġ / ����� ������Ű�� ���� ��� (�������ǻ翡 �Ⱓ�� ����)
    */
    
    
    -- ��Į�� ���� ���� : SELECT ������ ���
    -- ��� ���� ���� ���� ��Į�� ������ ��ȯ
    -- �� ���� �� �ֹ� ���� ���
    SELECT clientNo, (SELECT clientName
                                    FROM client
                                    WHERE client.clientNo = bookSale.clientNo) AS "����", SUM(bsQty)
    FROM bookSale
    GROUP BY clientNo;
    
    
    -- �ζ��� �� : FROM ������ ���
    -- ����� ��(���� ���̺�) ���·� ��ȯ
    SELECT bookName, bookPrice, SUM(bsQty) AS "�� �Ǹ� ����", SUM(bookPrice * bsQty) AS "�� �Ǹž�"
    FROM (SELECT bookNo, bookName, bookPrice
                FROM book
                WHERE bookPrice >= 25000) book, bookSale
    WHERE book.bookNo = bookSale.bookNo
    GROUP BY book.bookNo, bookName, bookPrice
    ORDER BY "�� �Ǹž�" DESC;
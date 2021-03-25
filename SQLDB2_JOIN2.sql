
        -- ���� (LEFT) ����
        SELECT *
        FROM client C
            LEFT OUTER JOIN bookSale BS
            ON C.clientNo = BS.clientNo
            ORDER BY C.clientNo;
     
            
        -- ������ (RIGHT) ����
        SELECT *
        FROM client C
            RIGHT OUTER JOIN bookSale BS
            ON C.clientNo = BS.clientNo
            ORDER BY C.clientNo;
            
            
        -- FULL OUTER JOIN
        SELECT *
        FROM client C
            FULL OUTER JOIN bookSale BS
            ON C.clientNo = BS.clientNo
            ORDER BY C.clientNo;
            
            
        -- ����Ŭ OUTER ����
        -- (+) �����ڷ� ���� �ÿ�, ���� ���� ���� ���� ��ġ
        SELECT *
        FROM client C, bookSale BS
        WHERE C.clientNo = BS.clientNo(+)
        ORDER BY C.clientNo;
        
        SELECT *
        FROM client C, bookSale BS
        WHERE C.clientNo(+) = BS.clientNo
        ORDER BY C.clientNo;
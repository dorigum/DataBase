
    -- ���� �Լ�
    
    /*
        ���� �Լ�
            - REPLACE() : ���ڿ� ġȯ
            - LENGTH() : ���� �� ��ȯ
            - LENGTHB() : ����Ʈ �� ��ȯ
            - SUBSTR() : ������ ���̸�ŭ�� ���ڿ� ��ȯ
    */
    
      -- REPLACE() : ���ڿ� ġȯ
        SELECT REPLACE('�ڹ� ���α׷���', '�ڹ�', '���̽�') FROM dual;
        
    -- '�ڹ�' ��ü�� '���̽�' ���� ġȯ
    
    -- TRANSLATE()
    SELECT TRANSLATE('apple aiplane apart', 'ap', '*^') FROM dual;
    -- 'ap' �� '*^'�� ġȯ
    -- ù��° ���� a�� *�� ġȯ,
    -- �ι�° ���� p�� ^�� ġȯ
    
    
    -- book ���̺��� ������ '�ȵ���̵�' �� ���Ե� ������ ����
    -- '�ȵ���̵�' �� 'Android' �� �����ؼ� ���
     SELECT * FROM book;
     
     SELECT bookNo, REPLACE(bookName, '�ȵ���̵�', 'Android') AS bookName, bookAuthor, bookPrice
     FROM book
     WHERE bookName LIKE '%�ȵ���̵�%';
     
     -- LENGTH() : ���� �� ��ȯ
     -- LENGTHB() : ����Ʈ �� ��ȯ
     -- '���� ���ǻ�' ���� �Ⱓ�� ������ ������� �������� ���ڼ�, ����Ʈ ��, ���ǻ�� ���
        SELECT B.bookName AS "������", LENGTH(B.bookName) AS "����",
                                                                LENGTHB(B.bookName) AS "���ǻ�"
        FROM book B
            INNER JOIN publisher P ON B.pubNo = P.pubNo
        WHERE P.pubName = '���� ���ǻ�';
        
        -- �ѱ� (UTF-8) : 3����Ʈ
        -- ������, ����, �����̽� : 1����Ʈ
        
        
        
        -- SUBSTR() : ������ ���̸�ŭ�� ���ڿ� ��ȯ
        -- SUBSTR(��ü ���ڿ�, ���� ��ġ, ����)
        
        -- ���� ���̺� : ���� �̸����� ������ ���
            SELECT SUBSTR(bookAuthor, 1, 1) AS "��"
            FROM book;
    
        -- ���� �̸����� ���� ������ �̸��� ���
            SELECT SUBSTR(bookAuthor, 2, 2) AS "�̸�"
            FROM book;
                
                
        -- ���� �̸� �߿��� ������ '��' �� ��� ���� ���
            SELECT bookAuthor
            FROM book
            WHERE SUBSTR(bookAuthor, 1, 1) = '��';
            
            
        -- ���� �̸����� ���� ������ ���� ����� �� ���̳� �Ǵ��� �˾ƺ��� ����
        -- ���� ���� �׷����� �ο� ���� ���
        SELECT SUBSTR(bookAuthor, 1, 1) AS "��", COUNT(*) AS "�ο� ��"
        FROM book
        GROUP BY SUBSTR(bookAuthor, 1, 1);
        
        
        
        -- CONCAT() : ���ڿ� ���� �Լ�
        -- || : ���ڿ� ���� ������
        SELECT CONCAT('���ڿ�', ' ���� ���1'), '���ڿ�' || ' ' || '���� ���2'
        FROM dual;
        
        -- ���� : ������ : ���� �������� ���
        SELECT bookAuthor || ' : ' || bookName || ' : ' || bookPrice
        FROM book;    
        
        
        
        -- INSTR(���� ���ڿ�, ������ ���ڿ�, ã�� ���� ��ġ, ���� ��ġ) : ��ġ ��ȯ
        -- ���ڿ�(string)���� ������ ���ڿ�(substring)�� ã�Ƽ� ��ġ ��ȯ
        -- ������ ���ڿ��� ù��° �����ϴ� ��ġ ��ȯ
        SELECT INSTR('�ʵ��л� ����л� ���л�', '�л�', 1, 1)   -- 3 ���
        FROM dual;
        
        -- �ټ���° ���ں��� ã�Ƽ� �ι�° ������ ��ġ
        SELECT INSTR('�ʵ��л� ���л� ����л� ���л�', '�л�', 5, 2) FROM dual;
        
        
        
        -- LOWER() / UPPER() / INITCAP() : ù ���ڸ� �빮�ڷ� ��ȯ
        SELECT LOWER('Java Programming'), UPPER('Java Programming'), INITCAP('java programming')
        FROM dual;
        
        
        
        -- LPAD(���ڿ�, ����, ä�� ���ڿ�) : ���ʺ��� ä��
        -- RPAD(���ڿ�, ����, ä�� ���ڿ�) : �����ʺ��� ä��
        SELECT LPAD('�����ͺ��̽�', 20, '*') FROM dual;
        SELECT RPAD('�����ͺ��̽�', 20, '*') FROM dual;
        
        
        
        -- TRIM(������ ���� FROM ���ڿ�) : ���ڿ� �� �� ���� ����
        -- ������ ���� : LEADING(��), BOTH(����), TRAILING(��)
        SELECT TRIM('       ���ѹα�        ') FROM dual;
        SELECT TRIM(LEADING '*' FROM '***�����ͺ��̽�***') FROM dual;
        SELECT TRIM(TRAILING '*' FROM '***�����ͺ��̽�***') FROM dual;
        SELECT TRIM(BOTH '*' FROM '***�����ͺ��̽�***') FROM dual;
        
        
        
        
        -- ���� ��� �Լ�
        -- RANK() / DENSE_RANK() / ROW_NUMBER()
        -- RANK() : ���� ���� ��ȯ(���� ���� ������ŭ ����)
        -- DENSE_RANK() : ���� ���� ��ȯ (���� ���� ��� ���� 1 ����)
        -- ROW_NUMBER() : ���� ���� ��ȯ
        SELECT bookPrice,
                        RANK() OVER (ORDER BY bookPrice DESC) "RANK",
                        DENSE_RANK() OVER (ORDER BY bookPrice DESC) "DENSE_RANK",
                        ROW_NUMBER() OVER (ORDER BY bookPrice DESC) "ROW_NUMBER"
        FROM book;
        
        
        
        -- TOP N ��� : ROWNUM ���
        -- ���� ���ݼ��� 1~5�� ���
        -- ���̺� ������ ������ ���� �Ŀ� ������ ���
        SELECT ROWNUM, bookPrice
        FROM (SELECT bookPrice FROM book ORDER BY bookPrice DESC) book
        WHERE ROWNUM BETWEEN 1 AND 5;
        
        -- �̷��� �ۼ��ϸ� book ���̺� ���� �ۼ��Ǿ� �ִ� ������� 1~5��° �����Ͱ� ��µǾ�����Ф�
        SELECT ROWNUM, bookPrice
        FROM book
        WHERE ROWNUM BETWEEN 1 AND 5
        
        
        
        -- �׷��� �Ұ�� �Ѱ� ���
        -- ROLLUP() / CUBE() / GROUPING SETS()
        -- ROLLUP()
            -- �׷��� �Ұ�� �Ѱ� ����
            -- ������ �߿�� �� �տ� ���� �Ϳ� �Ұ� ����
        
        -- CUBE()
            -- �� �׷��� ��� ����� ���� ���� �Ұ�� �Ѱ� ����
            -- �׸�鰣 ���������� �Ұ踦 ���
        
        -- GROUPING SETS()
            -- Ư�� �׸� ���� �Ұ� ����
       
       CREATE TABLE cubeTBL (
        prdName varchar2(10),
        color varchar2(6),
        amount number(2)
       );
       
       INSERT INTO cubeTBL VALUES('��ǻ��', '����', 11);
       INSERT INTO cubeTBL VALUES('��ǻ��', '�Ķ�', 22);
       INSERT INTO cubeTBL VALUES('�����', '����', 33);
       INSERT INTO cubeTBL VALUES('�����', '�Ķ�', 44);
       INSERT INTO cubeTBL VALUES('���콺', '����', 55);
       INSERT INTO cubeTBL VALUES('���콺', '�Ķ�', 66);
       
       
       SELECT * FROM CUBETBL;
       
       
       -- CUBE() �Լ� : �� �׷��� ��� ����� ���� ���� �Ұ�� �Ѱ踦 ����
       -- �׸�� �� ���������� �Ұ踦 ���
       -- ��ǰ�� �Ұ�
       -- ���� �Ұ�
       -- �Ѱ�
       -- ��� �׸� �Ұ�
       SELECT prdName, color, SUM(amount) AS "���� �հ�"
       FROM cubeTBL
       GROUP BY CUBE(color, prdName)
       ORDER BY prdName, color;
       

       SELECT prdName, color, SUM(amount) AS "���� �հ�"
       FROM cubeTBL
       GROUP BY CUBE(prdName, color) -- prdName�� color�� ���� ���� (���� ��� ���� ��� ����)
       ORDER BY prdName, color;
       
       
       -- ROLLUP() : �׷��� �Ұ�� �Ѱ� ����
       -- �ڼ����� �߿�. �� �տ� ���� �Ϳ� ���ؼ��� �Ұ� ����
       
       -- ��ǰ�� �Ұ踸 ��� -> ���� �Ұ�� ���X
       -- �Ѱ� 
       SELECT prdName, color, SUM(amount) AS "���� �հ�"
       FROM cubeTBL
       GROUP BY ROLLUP(prdName, color) -- �� ó���� �ִ� prdName�� ���ؼ��� �Ұ� ����
       ORDER BY prdName, color;
       
       -- ���� �Ұ踸 ���
       SELECT prdName, color, SUM(amount) AS "���� �հ�"
       FROM cubeTBL
       GROUP BY ROLLUP(color, prdName) -- �� ó���� �ִ� color�� ���ؼ��� �Ұ� ����
       ORDER BY prdName, color;
       
       
       -- GROUPING SETS()
       -- Ư�� �׸� ���� �Ұ� ����
       -- �׸� �Ұ踸 ���
       SELECT prdName, color, SUM(amount) AS �����
       FROM cubeTBL
       GROUP BY GROUPING SETS(prdName, color);
       
       
       -- ��� ���� ���� ��µǴ��� ����
       SELECT prdName, color, SUM(amount) AS �����
       FROM cubeTBL
       GROUP BY GROUPING SETS(color, prdName); -- ���� �׸��� ���� ���
       
       
       
       -- ROLLUP() / CUBE() / GROUPING SETS() ����2
       CREATE TABLE sales (
        prdName varchar2(20),
        salesDate varchar2(10),
        prdCompany varchar2(10),
        salesAmount number(8)
       );
       
       INSERT INTO sales VALUES ('��Ʈ��', '2021.01', '�Ｚ', 10000);
       INSERT INTO sales VALUES ('��Ʈ��', '2021.03', '�Ｚ', 20000);
       INSERT INTO sales VALUES ('�����', '2021.01', 'LG', 12000);
       INSERT INTO sales VALUES ('�����', '2021.03', 'LG', 20000);
       INSERT INTO sales VALUES ('������', '2021.01', 'HP', 3000);
       INSERT INTO sales VALUES ('������', '2021.03', 'HP', 1000);
       
       SELECT * FROM SALES;
       
       
       -- CUBE() �Լ� ����ؼ� �Ұ� �� �Ѱ� ���
       -- ��ǰ�� �Ұ�
       -- ��¥�� �Ұ�
       -- �Ѱ�
        SELECT prdName, salesDate, SUM(salesAmount) AS �����
        FROM sales
        GROUP BY CUBE(prdName, salesDate) -- ���� �ٲ� ����� ����
        ORDER BY prdName, salesDate;
       
       
       -- ROLLUP() �Լ� ����ؼ� �Ұ� �� �Ѱ� ���
       -- prdName (��ǰ�� �Ұ踸 ���)
       -- �Ѱ� ���
       SELECT prdName, salesDate, SUM(salesAmount) AS �����
       FROM sales
       GROUP BY ROLLUP(prdName, salesDate); -- ��ǰ�� �Ұ踸 ��� (���� �͸� �Ұ� ����)
       
       -- salesDate (��¥�� �Ұ踸 ���)
       -- �Ѱ�
       SELECT prdName, salesDate, SUM(salesAmount) AS �����
       FROM sales
       GROUP BY ROLLUP(salesDate, prdName); -- ��¥�� �Ұ踸 ��� (���� �͸� �Ұ� ����)

       
       -- GROUPING SETS() �Լ� ����ؼ� �Ұ� �� �Ѱ� ���
       SELECT prdName, salesDate, SUM(salesAmount) AS �����
       FROM sales
       GROUP BY GROUPING SETS(prdName, salesDate); -- ��ǰ�� �Ұ谡 ���� ���
       
       
       SELECT prdName, salesDate, SUM(salesAmount) AS �����
       FROM sales
       GROUP BY GROUPING SETS(prdName, salesDate); -- ��¥�� �Ұ谡 ���� ���
       
       
       
       -- ���� ���̺��� �̿��Ͽ� �پ��� �Ұ�, �Ѱ� ����غ���
       SELECT pubNo, SUM(bookPrice)
       FROM book
       GROUP BY CUBE(pubNo); -- ��� ���� �ۼ��غ� ��
       
       
       SELECT bookNo, bsDate, SUM(bsQty) AS "�� �ֹ� ����"
       FROM bookSale
       GROUP BY CUBE(bookNo, bsDate)
       ORDER BY bookNo, bsDate;
       
       
       SELECT bookNo, bsDate, SUM(bsQty) AS "�� �ֹ� ����"
       FROM bookSale
       GROUP BY ROLLUP(bookNo, bsDate)
       ORDER BY bookNo, bsDate;
       
       
       SELECT bookNo, bsDate, SUM(bsQty) AS "�� �ֹ� ����"
       FROM bookSale
       GROUP BY ROLLUP(bsDate, bookNo)
       ORDER BY bookNo, bsDate;
       
       
       
       
       /*
            ��¥ ���� �Լ�
            -- EXTRACT() / ADD_MONTHS()
            -- �� ��ȯ �Լ� : TO_CHAR()
        */
        
        -- ���� ��¥ ���
        SELECT SYSDATE FROM dual;
        SELECT CURRENT_DATE FROM dual;
        
        
        SELECT SYSDATE + 1 FROM dual; -- ���� ��¥���� 1�� �� ��¥ ���
        SELECT SYSDATE -1 FROM dual; -- ���� ��¥���� 1�� �� ��¥ ���
        
        -- ����, ����, ���� ��¥ ���
        SELECT SYSDATE - 1 ����, SYSDATE ����, SYSDATE + 1 ���� FROM dual;
        
        
        
        -- ADD_MONTHS()
        -- 1�� ��
        SELECT ADD_MONTHS(SYSDATE, 1) FROM dual;
        
        -- 1�� ��
        SELECT ADD_MONTHS(SYSDATE, -1) FROM dual;

        -- 1�� ��
        SELECT ADD_MONTHS(SYSDATE, 12) FROM dual;
        
        -- 1�� ��
        SELECT ADD_MONTHS(SYSDATE, -12) FROM dual;
        
        
        -- EXTRACT() : ���� ��¥���� ��, ��, �� ����
        SELECT  EXTRACT(YEAR FROM SYSDATE) ��,
                        EXTRACT(MONTH FROM SYSDATE) ��,
                        EXTRACT(DAY FROM SYSDATE) ��
        FROM dual;
        
        
        -- �۳�, ����, ����
        SELECT  EXTRACT(YEAR FROM SYSDATE) -1 �۳�,
                        EXTRACT(YEAR FROM SYSDATE) ����,
                        EXTRACT(YEAR FROM SYSDATE) +1 ����
        FROM dual;
        
        
        
        -- (1) �����ֹ� ���̺��� �ֹ��Ͽ� 7���� ���� ���� ����Ϸ� ����ؼ� ���
        -- �ֹ���, �����
        -- ��¥ ����
        -- ��¥ + ���� : ��¥�κ��� �Ⱓ��ŭ ���� ��¥ ���
        -- �ֹ��Ͽ� 7���� ���� ���� ����Ϸ� ���
        SELECT bsDate AS �ֹ���, bsDate + 7 AS �����
        FROM bookSale;
        
        -- (2) ���� ���̺��� ������� ���ǿ��� ��� (EXTRACT() �Լ� ���)
        SELECT  bookName AS ������, EXTRACT(YEAR FROM bookDate) AS ���ǿ���
        FROM book;
        
        
        -- ���� �ð� ���
        SELECT CURRENT_TIMESTAMP FROM dual;
        
        SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') FROM dual;
        SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM dual; -- 24�ð���
        
        
        -- �ð� ����
        SELECT  TO_CHAR(SYSDATE, 'HH24') ��,
                        TO_CHAR(SYSDATE, 'MI') ��,
                        TO_CHAR(SYSDATE, 'SS') ��
        FROM dual;
        
        
        -- ��¥ ���� : ��, ��, ��
        SELECT  TO_CHAR(SYSDATE, 'YYYY') ��,
                        TO_CHAR(SYSDATE, 'MM') ��,
                        TO_CHAR(SYSDATE, 'DD') ��
        FROM dual;
        
        
        -- bookSale ���̺��� �ֹ� ��¥�� '��' �� ǥ��
        SELECT bsDate AS "�ֹ�����", TO_CHAR(bsDate, 'MM') AS "�ֹ� ��"
        FROM bookSale;
        
        
        
        -- NVL2(��, NULL�� �ƴ� ��� ��ȯ, NULL�� ��� ��ȯ)
        SELECT clientHobby, NVL2(clientHobby, 'Y', 'N')
        FROM client;
        
        -- ��̰� NULL�� ���� ��ĭ�� ��츦 ã�Ƽ� "����" ���� ����
        SELECT clientHobby FROM client;
        
        UPDATE client SET clientHobby = '����'
        WHERE NVL2(clientHobby, 'Y', 'N') = 'N' OR clientHobby = ' ';
        
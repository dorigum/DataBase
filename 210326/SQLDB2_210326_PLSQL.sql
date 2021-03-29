    /*
        PL/SQL : ����Ŭ�� ����� ������ ���
            - ���ν��� ȣ���ؼ� ���
        
            
        ���� ����
        DECLARE
            -- �����
            ������1 ������Ÿ��;
            ������2 ������Ÿ��;
            
        BEGIN
            -- �����
            -- ���⿡ ���� �ڵ� �ۼ�
            
        END    
    */
    
    -- ȭ�� ��� ��� (���� ���� ���ȿ� 1ȸ ����)
    -- ���� - DBMS ��� Ŭ�� �� - ���� DBMS ��¿��� + ��ư ���� �� �Ʒ� �ڵ� ����
    SET SERVEROUTPUT ON;
    DECLARE
            name VARCHAR2(10);
            age NUMBER(3);
            
    BEGIN
            name := 'ȫ�浿';
            age := 23;
            
            -- ���� ����� DBMS â�� ���
            DBMS_OUTPUT.PUT_LINE(name);
            DBMS_OUTPUT.PUT_LINE(age);
    
    END;
    
    
    -- ���� ����� ���ÿ� �� �ʱ�ȭ
    DECLARE
        name VARCHAR2(10) := '�̸���';
        age NUMBER(3) := 35;
        
    BEGIN
        DBMS_OUTPUT.PUT_LINE(name);
        DBMS_OUTPUT.PUT_LINE(age);
        
    END;
    
    
    
    -- ���̺��� ���� ���� ������ ����
    -- ������ ������ Ÿ���� ���̺��� ���� Ÿ������ ����
    DECLARE
        -- book ���̺��� bookPrice Ÿ������ ����
        bPrice book.bookPrice%TYPE;
        
    BEGIN
        -- bookPrice ���� ���� �˾ƿͼ� ���� bPrice�� ����
        SELECT bookPrice INTO bPrice FROM book WHERE bookName = '�ڹ� ���α׷���';
        
        -- ���� ���� ���
        DBMS_OUTPUT.PUT_LINE(bPrice);
        
    END;
    
    
    
    
    -- ��� : CONSTANT Ű���� ���
    -- ����� ���α׷� ���� �߿� �� ���� �Ұ�
    DECLARE
        -- ���� ���� �� �ʱ�ȭ
        price NUMBER(5) := 100;
        points NUMBER(4);
        
        -- ��� rate �ʱ�ȭ
        rate CONSTANT NUMBER(2, 2) := 0.03;
        
    BEGIN
        price := 200; -- ���� �� ���� ���� (���� ����)
        -- rate := 0.05; -- ��� �� ���� �Ұ� (���� �߻�)
        points := price * rate;
        DBMS_OUTPUT.PUT_LINE(points);
    
        DBMS_OUTPUT.PUT_LINE('���� ����Ʈ : ' || points);
    END;
    
    
    
    /*
        ���ǹ�
            - IF ��
            - CASE ��
        
            
        [IF �� ����]
        IF <����> THEN
            ������ ���� �� ����Ǵ� ����;
            
        ELSE
            ������ ������ �� ����Ǵ� ����;
            
        END IF;    
    */
    
    
    -- IF ��
    DECLARE
        bStock NUMBER(5);
    
    BEGIN
        -- book ���̺��� bookStock ���� ���� ���� bStock�� ����
        -- ���� : bookNo�� '1003'
        SELECT bookStock INTO bStock FROM book WHERE bookNo = '1002';

        -- bStock �� ���
        DBMS_OUTPUT.PUT_LINE('��� : ' || bStock);
    
        -- ��� 7 �̻��̸� '��� ���� ����' ���, 7 �̸��̸� '��� ���� ����' ���
        IF bStock >= 7 THEN
            DBMS_OUTPUT.PUT_LINE('��� ���� ����');
            
        ELSE
            DBMS_OUTPUT.PUT_LINE('��� ���� ����');
            
        END IF;
        
    END;
    
    
    
    
    /*
        CASE ��
            - ���ǿ� ���� ��� �� ��ȯ
            - ������ ���� ���� ��쿡 ���
            - �ַ� SELECT ������ ��ȯ ���� ���� ���
            - ��ȯ ���� ������ �����ؼ� ����ص� ��
            
        ����
            CASE
            
                WHEN ����1 THEN ���1
                WHEN ����2 THEN ���2
                WHEN ����3 THEN ���3
                
                ELSE
                
            END
    */
    
    
    -- CASE �� �� : SELECT ������ ��ȯ ���� ���� ���
        SELECT C.clientName, SUM(B.bookPrice * bsQty) AS "�� �ֹ���",
            CASE
                WHEN SUM(B.bookPrice * bsQty) >= 200000 THEN '�ֿ��'
                WHEN SUM(B.bookPrice * bsQty) >= 100000 THEN '���'
                WHEN SUM(B.bookPrice * bsQty) >= 50000 THEN '�Ϲ�'
                ELSE '���ɰ�'
            END AS "�����"
            
        FROM bookSale BS
            INNER JOIN client C ON C.clientNo = BS.clientNo
            INNER JOIN book B ON B.bookNo = BS.bookNo
        GROUP BY C.clientNo, C.clientName
        ORDER BY "�� �ֹ���" DESC;
        
        
    -- CASE �� ���� : ��ȯ ���� ������ �����ؼ� ���
    DECLARE
            bStock NUMBER(5);
            resultValue VARCHAR2(10);
            
    BEGIN
        -- book ���̺��� bookStock ���� ���� ���� bStock�� ����
        SELECT bookStock INTO bStock FROM book WHERE bookNo = '1003';
        DBMS_OUTPUT.PUT_LINE('��� : ' || bStock);  -- ��� : xx ���
        
       resultValue :=
            CASE
                WHEN bStock >= 7 THEN '����'
                WHEN bStock >= 4 THEN '����'
                ELSE '��� ���� ���'
            END;    
        
        -- resultValue �� ���
         DBMS_OUTPUT.PUT_LINE('��� ���� : ' || resultValue);
    END;
    
    
    
    
    
    /*
        �ݺ���
        - LOOP
        - FOR ~ LOOP
        - WHILE ~ LOOP
    */
    
    /*
        <LOOP �� ����>
        
        �ʱⰪ
        LOOP
            ������
                �ݺ� ����Ǵ� ����
                ���� ����
                
        END LOOP;
        
        -- �ʱⰪ, ������, ���� ���� �ʿ�
        *���� !! : ���� ������ ������ ���� �ݺ�
    */
    
    
    DECLARE
            i NUMBER(3) := 0;
    
    BEGIN
        LOOP
            i := i + 1;  -- ������
            DBMS_OUTPUT.PUT_LINE(i);    -- �ݺ� ����Ǵ� ����
            EXIT WHEN i >= 10;   -- ���� ����
        END LOOP;
    END;
    
    
    
    
    
    /*
        <FOR ~ LOOP �� ����>
    
        FOR ���� IN [REVERSE] ���۰� .. ���ᰪ
        LOOP
            �ݺ� ����Ǵ� ����
        END LOOP;
        
        -- REVERSE : 1�� ����
    */
    
    -- FOR ~ LOOP �� : 1 ~ 10 ���
    DECLARE
        i NUMBER(3);
        
    BEGIN
        FOR i IN 1 .. 10
        LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
    END; 
    
    
    
    -- FOR ~ LOOP �� : 1 ~ 100 �� ���
    DECLARE
        i NUMBER(3);
        total NUMBER(5) := 0;
        
        BEGIN
            FOR i IN 1 .. 100
        LOOP
            total := total + i;
        END LOOP;
            DBMS_OUTPUT.PUT_LINE(total);
    END;
    
    
    -- ��� 5�� �̻��� ���� �����ؼ�
    -- ������ ���
    -- ������ 200,000 �ʰ��� ��� ���
    DECLARE
        stockSum NUMBER(7);
        
        BEGIN
            -- ��� 5�� �̻��� ���� ����
            
            FOR b IN (SELECT bookName, bookPrice, bookStock
                        FROM book
                        WHERE bookStock >= 5)
                        
            LOOP
                -- ���� ���
                stockSum := b.bookPrice * b.bookStock;
                -- ������ 200,000 �ʰ��� ���� ���
                IF stockSum > 200000 THEN
                    DBMS_OUTPUT.PUT_LINE(b.bookName || ' : ' || stockSum);
                END IF;
            END LOOP;
        END;
        
        
        
        
        -- ���� ó��
        /*
            PL/SQL ��Ͽ��� �߻��ϴ� ����
            (1) ������ ���ǵ� ���� : ���� ������ �̸� ���ǵǾ� ����. �ڵ����� �߻�
            (2) ����� ���� ���� : ����ڰ� �߻� ������ ���ܸ�(���� ����)�� ��Ͽ� �����ϰ� ���� �߻� ��Ű�� ��
                - 1. ���� �̸� ���� (�����)
                - 2. RAISE ���� ����ؼ� ���� �߻�
                - 3. ���� ó�� �������� ���� ó��
        */
        
        
        -- (1) ������ �̸� ���ǵ� ���� ó��
        -- ����� 1���� ��� : ���� ó��
        -- ����� 0���� ��� : ���ڰ� ���ٰ� ���� ó�� (NO_DATA_FOUND)
        -- ����� 2�� �̻��� ��� : ���ڰ� �ʹ� ���ٰ� ���� ó�� (TOO_MANY_ROWS)
        DECLARE
            bAuthor book.bookAuthor%TYPE;
        BEGIN
            SELECT bookAuthor INTO bAuthor
            FROM book
            WHERE bookAuthor LIKE('ȫ%');    -- ��, ȫ, �� Ȯ��
            -- ���
            DBMS_OUTPUT.PUT_LINE('���� : ' || bAuthor || '�Դϴ�.');
        
            EXCEPTION
                WHEN NO_DATA_FOUND THEN -- 0�� ��ȯ�� ���
                    DBMS_OUTPUT.PUT_LINE('�ش� ���ڰ� �����ϴ�.');
                WHEN TOO_MANY_ROWS THEN -- 2�� �̻� ��ȯ�� ���
                    DBMS_OUTPUT.PUT_LINE('�ش� ���ڰ� �ʹ� �����ϴ�.');
        END;
        
       
        
    -- (2) ������ �̸� ���ǵ� ���� ó��2
    -- �⺻Ű �ߺ� ���� ó��
    BEGIN
        INSERT INTO book
        VALUES ('2021', 'SQL', '�ڱ浿', 20000, '2020-11-12', 5, '1');
        COMMIT; -- ���� ������ ���������� DB�� �ݿ�
        
        -- ������ ������ ���
        DBMS_OUTPUT.PUT_LINE('��� ����');
        
        -- ������ �߻��ϸ� ���� ó��
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN -- �⺻Ű �ߺ��� ���
            DBMS_OUTPUT.PUT_LINE('�⺻Ű �ߺ� : �̹� �����ϴ� ������ȣ �Դϴ�.');
        END;
        
        
        
        -- (3) ����� ���� ���� ó��
        -- �������� ���� ������ȣ�� ���� ���� �� ���� ó��
        DECLARE
            BOOKNO_NOT_FOUND EXCEPTION; -- (1) ����� ���� ������ ���� (�����)
        BEGIN
            -- �������� ���� ������ȣ�� ���� ����
            DELETE FROM book WHERE bookNo = '10100';
            
            -- SQL%NOTFOUND : �ش� SQL ���� ������ �޴� ���� ���� ���� ��� TRUE ��ȯ
            IF(SQL%NOTFOUND) THEN
                RAISE BOOKNO_NOT_FOUND; -- (2) ����� ���� ���� �߻�
            ELSE
                DBMS_OUTPUT.PUT_LINE('���� ����');
            END IF;
            
            -- ������ȣ�� �������� �ʴ� ��� ���� �߻� -> ���� ó��
            -- (3) ����� ���� ���ܸ�(���� ����)�� ���� ó��
            EXCEPTION
                WHEN BOOKNO_NOT_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('���� ������ȣ �Դϴ�.');
        END;

/*
    UPDATE ��
        - Ư�� ���� ���� �����ϴ� ��ɾ�
        - ���ǿ� �´� ���� ã�Ƽ� ���� �� ����
        - ���� : WHERE
        
        ���� : UPDATE ���̺�� SET �� = �� WHERE ����;
        �� : ��ǰ��ȣ�� 5�� ���� ��ǰ���� 'UHD TV' �� ����
        UPDATE product SET prdName = 'UHD TV' WHERE prdNo = '5';
*/


    -- ��ǰ ���̺� ��ȸ
        SELECT * FROM PRODUCT;
        SELECT prdName, prdPrice FROM PRODUCT;

    -- ��ǰ��ȣ�� 5�� ���� ��ǰ���� 'UHD TV'�� ����
        UPDATE product SET prdName = 'UHD TV' WHERE prdNo = '5';

    -- ��ǰ���� '�״ø� ��Ʈ' �� ���� ã�Ƽ� ������ 50000������ ����
        UPDATE product SET prdPrice = 50000 WHERE prdName = '�״ø� ��Ʈ';


/*
    DELETE ��
        - ���̺� �ִ� ���� ���� ����
        
        ���� : DELETE FROM ���̺�� WHERE ����;
        �� : ��ǰ�� '�״ø� ��Ʈ' �� �� ����
        DELETE FROM product WHERE prdName = '�״ø� ��Ʈ';
        
        - ���̺��� ��� �� ����
        DELETE FROM product;
*/

    -- ��ǰ�� '�״ø� ��Ʈ' �� �� ����
            DELETE FROM product WHERE prdName = '�״ø� ��Ʈ';
        
        
        
    /* ���� ����
        (1) book ���̺� ������ ���� �� ����
            6   |   JAVA ���α׷���  |   33000  |     2021-02-10  |   ���� ���ǻ�
            7   |   ���̽�                  |   24000  |     2019-10-10  |   �������� ����
            
        (2) book ���̺��� �������� '�����ͺ��̽�' �� ���� ������ 22000���� ����
        (3) book ���̺��� �������� 2015�⵵�� ���� ����
    */
    
    SELECT * FROM BOOK;
    
    -- (1) book ���̺� ������ ���� �� ����
    --     6   |   JAVA ���α׷���  |   33000  |     2021-02-10  |   ���� ���ǻ�
    --     7   |   ���̽�                  |   24000  |     2019-10-10  |   �������� ����
    
    INSERT INTO book
        VALUES ('6', 'JAVA ���α׷���', 33000, '2021-02-10', '1');
    
    INSERT INTO book
        VALUES ('7', '���̽�', 24000, '2019-10-10', '2');
    
    
    -- (2) book ���̺��� �������� '�����ͺ��̽�' �� ���� ������ 22000���� ����
    UPDATE book SET bookPrice = 22000 WHERE bookName = '�����ͺ��̽�';
    
    
    -- (3) book ���̺��� �������� 2015�⵵�� ���� ����
    DELETE FROM book WHERE bookDate >= '2015-01-01' AND bookDate <= '2015-12-31';
    
    -- SUBSTR() �Լ� ���
     DELETE FROM book WHERE SUBSTR(bookDate, 0, 4) = '2015';
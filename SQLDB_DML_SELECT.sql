    
    /*
        SELECT �� : ���̺��� ���ǿ� �´� �� �˻� (��ȯ)
        
        <�⺻ ����>
        SELECT �� �̸� : �˻��� �� (����Ʈ) ���
        FROM ���̺��
        [WHERE ����]
        [GROUP BY �� �̸�] : �׷� ���Ǹ� ����� �� ��� (Ư�� ���� �׷�ȭ�� ��, �� �׷쿡 ���� ��� ����)
        [HAVING �˻� ����] : GROUP BY ���� ���� ������ �׷쿡 ���� ������ ���� ���
        [ORDER BY �� �̸� [ASC | DESC]] : Ư�� ���� ���� �������� ���� ��� ����
                                                                ASC : �������� ����
                                                                DESC : �������� ����
    */
    
    
    -- ��� ��, �� �˻�
        SELECT * FROM BOOK;
        
    -- ���� ���̺��� ��� ���� �˻��Ͽ� ������� ���ݸ� ���
        SELECT BOOKNAME, BOOKPRICE FROM BOOK;
        
    -- ���� ���̺��� ���� ������ 20000�� �̻��� ������ ������� ���� ���
        SELECT BOOKNAME, BOOKPRICE
        FROM BOOK WHERE BOOKPRICE >= 20000;
        
        
        
        /*
            book, publisher, client, bookSale
            �� ����� ���� : KDYUSER2
            �� ���� ���� : SQLDB2
            
            4���� �ؽ�Ʈ ���� IMPORT �ؼ� ���̺� ����
            * ����!! ���� ���� ( �ܷ�Ű ���� ���� ����)
            
            ������ Ÿ��
                - ���� : bookPrice, bookStock, bsQty
                - ��¥ : bsDate,clientBirth, bookDate
      */
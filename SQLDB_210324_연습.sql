
/*
    ���� ����
    
    1. �� ���̺� (customer) ���� 
    2. �ֹ� ���̺� (orderProduct) ���� (�̹� ������ ��ǰ(product) ���̺� ���� �ֹ�)
    3. �� ���̺��� ��ȭ��ȣ ���� NOT NULL�� ����
    4. �� ���̺� ��������, �����̡� �� �߰�
    5. ��, �ֹ� ���̺� ������ ���� (3����)
    6. �ֹ� ���̺��� ��ǰ��ȣ�� 2�� ���� �ֹ������� 3���� ����
*/

    SELECT * FROM PRODUCT;

    -- 1. �� ���̺� (customer) ���� 
        CREATE TABLE customer (
            custNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            custName VARCHAR2(30),
            custPhone VARCHAR2(13),
            custAddress VARCHAR2(50)
        );
        
        
    -- 2. �ֹ� ���̺� (orderProduct) ���� (�̹� ������ ��ǰ(product) ���̺� ���� �ֹ�)
    -- �ֹ���ȣ, �ֹ���, �ֹ�����, ����ȣ, ��ǰ��ȣ
        CREATE TABLE orderProduct (
            ordNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            ordDate DATE,
            ordQty NUMBER(3),
            custNo VARCHAR2(10) NOT NULL,
            prdNo VARCHAR2(4) NOT NULL,
            CONSTRAINT FK_orderProduct_customer FOREIGN KEY (custNo) REFERENCES customer (custNo),
            CONSTRAINT FK_orderProduct_product FOREIGN KEY (prdNo) REFERENCES product (prdNo)
        );
        
        
    -- 3. �� ���̺��� ��ȭ��ȣ ���� NOT NULL�� ����
          ALTER TABLE customer MODIFY custPhone VARCHAR2(13) NOT NULL;
    
    
    -- 4. �� ���̺� ��������, �����̡� �� �߰�
         ALTER TABLE customer ADD (custGender VARCHAR(3), custAge NUMBER(3));
    
    
    -- 5. ��, �ֹ� ���̺� ������ ���� (3����)
        INSERT INTO customer VALUES ('1001', 'ȫ�浿', '010-1111-1111', '���', '��', 20);
        INSERT INTO customer VALUES ('1002', '�̸���', '010-2222-2222', '����', '��', 30);
        INSERT INTO customer VALUES ('1003', '������', '010-3333-3333', '����', '��', 25);
        
        SELECT * FROM CUSTOMER;
        SELECT * FROM PRODUCT;
        SELECT * FROM ORDERPRODUCT;
    
        INSERT INTO orderProduct VALUES ('1', '2021-01-01', 3, '1003', '10');
        INSERT INTO orderProduct VALUES ('2', '2020-02-22', 10, '1002', '2');
        INSERT INTO orderProduct VALUES ('3', '2021-03-01', 1, '1001', '5');
        INSERT INTO orderProduct VALUES ('4', '2021-03-01', 1, '1001', '2');
    
    
    -- 6. �ֹ� ���̺��� ��ǰ��ȣ�� 2�� ���� �ֹ������� 3���� ����
        UPDATE orderProduct SET ordQty =3 WHERE prdNo = '2';
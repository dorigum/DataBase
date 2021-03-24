
/*
    ������ ���۾� (DML : Data Manupulation Language)
        - ������ �Է� / ���� / ���� / �˻� (��ȸ)
        - INSERT ��
        - DELETE ��
        - UPDATE ��
        - SELECT ��
*/


/*
    INSERT �� : ���̺� ���ο� ���� �����ϴ� ��ɾ�
    ���� : INSERT INTO ���̺�� ( �� �̸� ����Ʈ) VALUES (�� ����Ʈ);
    �� : INSERT INTO student (stuNo, stuName, stuGrad, depNo)
         VALUES ('2020001', 'ȫ�浿', 3, '1');
         
    ���� : 1
    ���� : '1'
*/


SELECT * FROM book;
SELECT * FROM publisher;

-- book ���̺� ������ �Է�
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
    VALUES('1003', 'DB', 23000, '2019-11-12', '1');
    
    
-- ��� ���� �����͸� ������ ��쿡�� �� �̸� ���� ����
INSERT INTO book
    VALUES('1004', 'C++ ���α׷���', 18000, '2015-10-10', '2');
    
    
-- student ���̺� ������ �����ϰ� SELECT ������ ��ȸ
SELECT * FROM student;

INSERT INTO student VALUES('1002', '�̸���', 1, '1');
INSERT INTO student VALUES('1003', '����Ŭ', 4, '2');
INSERT INTO student VALUES('1004', '���ڹ�', 3, '2');


-- ���� ���� �����͸� �ѹ��� INSERT
INSERT ALL
    INTO student VALUES ('1006', '�̵��', 2, '3')
    INTO student VALUES ('1007', '������', 2, '3')
    INTO student VALUES ('1008', '���е�', 2, '3')
    INTO student VALUES ('1009', '��Ŀ��', 2, '3')
    SELECT * FROM dual;
    
    
    
    
    
    /*
        ������ (sequence)
            - �����ͺ��̽� ��ü�� ������ ������ �Ϸù�ȣ ����
            - ������ ��ġ�� �����ϰų� ����
            - �⺻Ű ���� �Ϸù�ȣ �ڵ� ������ �� ���
            - ���̺�� ���������� ����ǰ� ����
            - �ϳ��� �������� ���� ���̺��� ��� ����
    */
    
    
    -- ������ ����
    CREATE SEQUENCE NO_SEQ
        START WITH 1
        INCREMENT BY 1
        MAXVALUE 100000
        MINVALUE 1
        NOCYCLE;
        
        
    -- �������� ������ ���̺� ����
    CREATE TABLE board (
        bNo NUMBER PRIMARY KEY, -- �⺻Ű (������ ������ ��)
        bSubject VARCHAR2(30) NOT NULL,
        bName VARCHAR2(20) NOT NULL
    );
    
    -- ������ �߰�
    INSERT INTO board VALUES (NO_SEQ.NEXTVAL, '�߼�', 'ȫ�浿');
    INSERT INTO board VALUES (NO_SEQ.NEXTVAL, '�̼�����', '�̸���');
    INSERT INTO board VALUES (NO_SEQ.NEXTVAL, '�ް�', '������');
    
    SELECT * FROM BOARD;
    
    -- ���� �������� �� �˻�
    SELECT NO_SEQ.CURRVAL FROM DUAL;
    
 /*
    DUAL ���̺�
        - ����Ŭ ��ü���� �����Ǵ� ���̺�
        1���� ��� 1���� ���� �ִ� DUMMY ���̺�
        SYS ��������, ��� ����ڰ� ���� ����
        
        DUAL ���̺� �뵵
            - �����ϰ� �Լ��� �̿��ؼ� ��� ������� Ȯ���� ��
            Ư�� ���̺��� �������� �ʰ� ������� ���� ���� ���
 */
 
 SELECT SYSDATE FROM DUAL;
 SELECT CURRENT_DATE FROM DUAL;
 
 
 -- product ���̺� �⺻Ű ���� ���� �߰�
 ALTER TABLE product
 ADD constraint PK_product_prdNo
 PRIMARY KEY (prdNo);
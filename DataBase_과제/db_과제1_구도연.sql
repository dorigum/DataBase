    
    -- ������ ���� ������ ���̺� 2���� ���ڵ带 �����ϴ� SQL�� �ۼ��ϼ���.
    
    -- ���̺� ����
         CREATE TABLE Student (
            No int NOT NULL PRIMARY KEY,
            name CHAR(10),
            det CHAR(20),
            addr CHAR(80),
            tel CHAR(20)
        );
        
        
        
    -- ���ڵ� ����
    INSERT INTO Student VALUES(1, 'ȫ�浿', '�����а�', '����', '010-1111-1111');
    INSERT INTO Student VALUES(2, '��浿', '���а�', '��õ', '010-2222-2222');
    /* 
    (1) ���̺� ���� : CREATE ��
    (2) ���̺� ����  : ALTER ��
    (3) ���̺� ���� : DROP TABLE ��
    */
    
    
    /*
        DROP TABLE �� : ���̺� ������ �����͸� ��� ����
        -PURGE : ���� ������ �ӽ� ���̺��� �������� �ʰ� ����
        -CASCADE CONSTRAINT : ���������� �����ϰ� ���� ���̺��� ���� ���� (�������� ����)
    */
    
    
    -- department ���̺� ����
    -- �ܷ�Ű�� �����ϰ� �ִ� ���̺� �����ϸ� ���� �߻�
    DROP TABLE  department;
    
    -- department ���̺� ����
    -- �ܷ�Ű ���踦 �����ϰ� ���� ���̺��� ���� ����
    DROP TABLE department CASCADE CONSTRAINTS;
    
    -- product ���̺� ����
    DROP TABLE product;
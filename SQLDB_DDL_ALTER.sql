
/*

    (1) ���̺� ���� : CREATE ��
   
    (2) ���̺� ����  : ALTER ��
    
        ALTER TABLE ADD : �� �߰�
                                DROP COLUMN : �� ����
                                DROP : ���� ���� �� ����
                                RENAME COLUMN : ���� �̸� ����
                                MODIFY : ���� ������ ���� ����
                                DROP PRIMARY KEY : �⺻Ű ����
                                DROP CONSTRAINT : �������� ����
                                
*/




    -- �� �߰� : STUDENT ���̺� stuTel �� �߰�
    ALTER TABLE student ADD stuTel VARCHAR2(13);
    
    
    -- ���� ���� �� �߰� : stuAge, stuAddress2 �� �߰�
    ALTER TABLE student ADD (stuAge VARCHAR2(2), stuAddress2 VARCHAR2(50));
    
    
    -- ���� ������ ���� ���� : stuAge ���� Ÿ���� NUMBER(3) �� ����
    ALTER TABLE student MODIFY stuAge NUMBER(3);
    
    
    -- ���� ���� ���� ���� : stuName�� NULL�� ���
    ALTER TABLE student MODIFY stuName VARCHAR2(20) NULL;
    
    
    -- �� �̸� ���� : stuTel���� stuHP�� ����
    ALTER TABLE student RENAME COLUMN stuTel TO stuHP;
    
    
    -- �� ���� : stuHP �� ����
    ALTER TABLE student DROP COLUMN stuHP;
    
    
    -- ���� ���� �� ���� : stuAge, stuAddress, stuAddress2 �� ����
    -- (���� stuAddress �� ��� stuAddress2�� ������!)
    ALTER TABLE student DROP (stuAge, stuAddress2);
    
    
    
    
    
    /*
        ���̺� ALTER ���� ����
            1. product ���̺� ���� ���� ���� prdStock�� �������� ��Ÿ���� prdDate �� �߰�
            2. product ���̺��� prdCompany ���� NOT NULL�� ����
            3. publisher ���̺� pubPhone, pubAddress �� �߰�
            4. publisher ���̺��� pubPhone �� ����
            
            �� ���徿 �����ϰ�, ���̺� ���ΰ�ħ�ؼ� ��� Ȯ��
    */
    
    -- 1. product ���̺� ���� ���� ���� prdStock�� �������� ��Ÿ���� prdDate �� �߰�
    ALTER TABLE product ADD prdStock NUMBER(20);
    ALTER TABLE product ADD prdDate DATE;
    -- => ALTER TABLE product ADD (prdStock NUMBER(20), prdDate DATE);
    
    -- 2. product ���̺��� prdCompany ���� NOT NULL�� ����
    ALTER TABLE product MODIFY prdCompany VARCHAR2(20) NOT NULL;
    
    -- 3. publisher ���̺� pubPhone, pubAddress �� �߰�
    ALTER TABLE publisher ADD pubPhone VARCHAR2(13);
    ALTER TABLE publisher ADD pubAddress VARCHAR2(50);
    -- => ALTER TABLE publisher ADD (pubPhone VARCHAR2(13), pubAddress VARCHAR2(50));
    
    -- 4. publisher ���̺��� pubPhone �� ����
    ALTER TABLE publisher DROP COLUMN pubPhone;
    
    
    
    
    /*
        �⺻Ű / �ܷ�Ű ����
        * ����!! (�ܷ�Ű ���� ������ �����Ǿ� �ִ� ���, �⺻Ű�� �����ϸ� ���� �߻�)
        
        �а� ���̺��� �⺻Ű�� �а��ڵ带 ������ ���,
        �а��ڵ带 �����ϰ� �ִ� �л� ���̺��� �����ϱ� ������
        ������ �� ���ٴ� ���� �߻�
    */
    
     -- �������� �����ϰ� �⺻Ű ����
    ALTER TABLE department DROP PRIMARY KEY CASCADE;

    -- �ܷ�Ű ���� ���� ����
    ALTER TABLE student DROP CONSTRAINT FK_student_department;
    
    -- �⺻Ű �������� �߰�
    ALTER TABLE department ADD CONSTRAINT PK_department_depNo PRIMARY KEY (depNo);
    
    -- �ܷ�Ű �������� �߰�
    ALTER TABLE student ADD CONSTRAINT FK_student_department FOREIGN KEY (depNo) REFERENCES department (depNo);
    
    
    /*
        ON DELETE CASCADE
        - ���� ���̺��� �����Ͱ� �����Ǿ��� ��
        -- �ܷ�Ű ���̺��� �����͵� �ڵ����� �����ǵ��� ����
    */
    
    ALTER TABLE student
        ADD CONSTRAINT FK_student_department foreign key (depNo) references department (depNo) on delete cascade;
        
        
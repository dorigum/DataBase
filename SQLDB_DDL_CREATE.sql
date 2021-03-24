
    -- ��ǰ ���̺� ����
    -- ��������
        -- �⺻Ű : prdNo, NOT NULL
        -- prdName : NOT NULL
        
        CREATE TABLE product (
            prdNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            prdName VARCHAR2(30) NOT NULL,
            prdPrice NUMBER(8),
            prdCompany VARCHAR2(30)
        );
        
        
        
        CREATE TABLE product (
            prdNo VARCHAR2(10) NOT NULL,
            prdName VARCHAR2(30) NOT NULL,
            prdPrice NUMBER(8),
            prdCompany VARCHAR2(30),
            CONSTRAINT PK_product_prdNo PRIMARY KEY (prdNo)
        );
        
        
        /*
            ���ǻ� ���̺� ���� (���ǻ��ȣ, ���ǻ��) pubNo, pubName
            ��������
                - �⺻Ű�� pubNo ����, NOT NULL
                - pubName : NOT NULL
        */
        
        CREATE TABLE publisher (
            pubNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            pubName VARCHAR2(30) NOT NULL
            );
            
            
            
            /*
               ���� ���̺� ���� (������ȣ, ������, ����, ������, ���ǻ��ȣ)
              ��������
                    - �⺻Ű ���� : bookNo, NOT NULL
                   - �ܷ�Ű ���� : pubNo (���� ���̺�� �⺻Ű ����)
                - ���ǻ� ���̺� (Publisher) ����
                  - bookPrice�� �⺻������ 10000 ����, 1000���� ũ�� ����
            */
            
            create table book (
                bookNo VARCHAR2(10) not null primary key,
                bookName varchar2(30),
                bookPrice number(8) default 10000 check(bookPrice > 1000),
                bookDate date,
                pubNo VARCHAR2(10) not null,
                constraint FK_book_publisher foreign key (pubNo) REFERENCES publisher (pubNo)
            );
            
            /*
            constraint FK_book_publisher foreign key (pubNo) REFERENCES publisher (pubNo)
            constraint FK_book_publisher foreign key (book ���̺��� pubNo ��(�ܷ�Ű)
            REFERENCES �����ϴ� ���̺�(���ǻ� ���̺�)(���ǻ� ���̺��� �⺻Ű)
            */
            
            
            
            
            /*
                ���̺� ���� ���� : (1) publisher (2) book
                ���̺� �Է� ���� : (1) publisher (2) book
                �� ������� �������� �ʰų� �����͸� �Է����� ������
                -- [���� ���Ἲ ��������] �� �����ؼ� ������ �߻�
            */
            
            
            
            /*
                1. ���� ���ǻ�
                2. �������� ����
                3. ���� ���ǻ�
            */
            
            
            /*
                ���̺� ����
                    - �л� (student) (�й�, �̸�, �а�, �г�)
                    - �а� (department) (�а���ȣ, �а��̸�)
                    
                ������ �Է� ( ���� ���Ἲ ���� ���ǿ� ������� �ʰ� �����͸� �Է��� �� �ִ��� ���� ���ؼ�)
                    - �� ���̺� 2�� ���� �Է�
                    
                ��������
                - �⺻Ű ����
                - �л��� �а��� �Ҽ�
                -�л� �̸��� �а� �̸��� NULL ������� ����
                - �г��� 4�� �⺻������, ������ 1~4�� ����
            */
            
            -- �л� ���̺� ����
            CREATE TABLE STUDENT (
                stuNo VARCHAR2(20) NOT NULL PRIMARY KEY,
                stuName VARCHAR2(20) NOT NULL,
                stuGrad NUMBER(3) default 4 check (stuGrad >= 1 and stuGrad <= 4 ),
                depNo VARCHAR2(20) not null,
                CONSTRAINT FK_student_department foreign key (depNo) REFERENCES DEPARTMENT (depNo)
            );
            
            
            -- �а� ���̺� ����
            CREATE TABLE DEPARTMENT (
                depNo VARCHAR2(20) NOT NULL PRIMARY KEY,
                depName VARCHAR2(30) NOT NULL
            );
            
            
            
            
            /*
                ���� ���̺� ����
                    - ������ �а��� �ҼӵǾ� �ִ�.
                
                ���� ���̺� ����
                    - ������ ������ �����Ѵ�.
                    - ���� ������ ����
            */
            
            create table education (
                eduNo VARCHAR2(10) not null PRIMARY KEY,
                eduName varchar2(30) not null,
                eduScore varchar2(3),
                proNo varchar2(10) not null,
                constraint FK_education_professor foreign key (proNo) REFERENCES professor (proNo)
            );
            
            create table professor (
                proNo varchar2(10) not null primary key,
                proName varchar2(20) not null,
                depNo varchar2(20) not null,
                constraint FK_professor_department foreign key (depNo) REFERENCES DEPARTMENT (depNo)
            );
            
            
            
            
            
            /*
                �а� (�а��ڵ�, �а���, ��ȭ��ȣ)
                �л� (�й�, ����, �г�, �ּ�, �������, �а��ڵ�)
                ���� (������ȣ, ������, ����, ��ȭ��ȣ, �а��ڵ�)
                ���� (�����ڵ�, �����, ����, ������ȣ)
                ���� (�й�, �����ڵ�, ����, ���) / (�й�, �����ڵ�) 2���� �⺻Ű�� ���� (����Ű)
                  : �л��� ������ �����ؼ� ������ ����� ����
            */
            
            
            CREATE TABLE SCORES (
                stuNo varchar2(20) not null,
                eduNo varchar2(10) not null,
                score number(3),
                grade VARCHAR2(2),
                CONSTRAINT PK_scores_stuNo_eduNo primary key (stuNo, eduNo),
                CONSTRAINT FK_scores_student FOREIGN key (stuNo) references student (stuNo),
                CONSTRAINT FK_scores_education foreign key (eduNo) references education (eduNo)
            );
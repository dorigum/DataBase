    -- ���� / �����ͺ��̽� �ͽ���Ʈ
    -- ���� ����
    -- ������ ���ϸ� ���� : �ͽ���Ʈ1.sql
    -- ����� ���̺� ���� (���)
    
    
    -- ������ �ս� ����
    -- BACKUP ������ ���̺� ��� ����
    
    
    -- ����
    -- �ͽ���Ʈ1.sql�� ���� ���̺� ����
    -- ����!! ����� ����� ������ �����ؾ� ��! (���� ������ �����Ǿ� �־�� ��)
    -- TableSpace�� �־����
    -- �ͽ���Ʈ1.sql ���� ���� '��ũ��Ʈ ����'
    -- ���̺� ���� Ȯ��
    
    
    
    
    create table book (
        bookNo VARCHAR2(10) not null primary key,
        bookName varchar2(30),
        bookPrice number(8) default 10000 check(bookPrice > 1000),
        bookDate date,
        pubNo VARCHAR2(10) not null,
        constraint FK_book_publisher foreign key (pubNo) REFERENCES publisher (pubNo)
            );
            
            
        CREATE TABLE publisher (
            pubNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            pubName VARCHAR2(30) NOT NULL
            );
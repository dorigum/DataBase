/*
    <���� ����>
    
    1. �� ���̺��� ����, �������, ���� ���
    2. �� ���̺��� �ּҸ� �˻��Ͽ� ��� (�ߺ��Ǵ� Ʃ���� �ѹ��� ���)
    3. �� ���̺��� ��̰� '�౸'�̰ų� '���'�� ���� ����, ��� ���
    4. ���� ���̺��� ������ �� ��° ��ġ�� '��'�� ��� �ִ� ���ڸ� ��� (�ߺ��Ǵ� Ʃ���� �ѹ��� ���)
    5. ���� ���̺��� �������� 2018���� ������ ������, ����, ������ ���
    6. �����Ǹ� ���̺��� ����ȣ1, 2�� ������ ��� Ʃ�� ���
    7. �� ���̺��� ��̰� NULL�� �ƴϸ鼭 �ּҰ� '����'�� ���� ����, �ּ�, ��� ���
    8. ���� ���̺��� ������ 25000 �̻��̸鼭 ���� �̸��� '�浿'�� ���� ������ ������, ����, ����, ��� ���
    9. ���� ���̺��� ������ 20,000 ~25,000���� ��� Ʃ�� ��� 
    10. ���� ���̺��� ���ڸ� '�浿'�� ��� ���� �ʴ� ������ ������, ���� ���

*/

    -- 1. �� ���̺��� ����, �������, ���� ���
        SELECT clientName, clientBirth, clientGender FROM client;
        
    -- 2. �� ���̺��� �ּҸ� �˻��Ͽ� ��� (�ߺ��Ǵ� Ʃ���� �ѹ��� ���)
        SELECT DISTINCT clientAddress FROM client;
        
    -- 3. �� ���̺��� ��̰� '�౸'�̰ų� '���'�� ���� ����, ��� ���
        SELECT clientName, clientHobby FROM client
        WHERE clientHobby = '�౸' OR clientHobby = '���' ;
        
    -- 4. ���� ���̺��� ������ �� ��° ��ġ�� '��'�� ��� �ִ� ���ڸ� ��� (�ߺ��Ǵ� Ʃ���� �ѹ��� ���)
        SELECT DISTINCT bookAuthor FROM book
        WHERE bookAuthor LIKE '_��%';
        
    --5. ���� ���̺��� �������� 2018���� ������ ������, ����, ������ ���
        SELECT bookName, bookAuthor, bookDate FROM  book
        WHERE bookDate LIKE  '2018%';
        
    -- 6. �����Ǹ� ���̺��� ����ȣ1, 2�� ������ ��� Ʃ�� ���
        SELECT * FROM bookSale
        WHERE clientNo NOT IN ('1', '2');
        
   -- 7. �� ���̺��� ��̰� NULL�� �ƴϸ鼭 �ּҰ� '����'�� ���� ����, �ּ�, ��� ���
        SELECT clientName, clientAddress, clientHobby FROM client
        WHERE clientHobby IS NOT NULL AND clientAddress LIKE '%����%';
        
   -- 8. ���� ���̺��� ������ 25000 �̻��̸鼭 ���� �̸��� '�浿'�� ���� ������ ������, ����, ����, ��� ���
        SELECT bookName, bookAuthor, bookPrice, bookStock FROM book
        WHERE bookPrice >= 25000 AND bookAuthor LIKE '%�浿%';
        
   -- 9. ���� ���̺��� ������ 20,000 ~25,000���� ��� Ʃ�� ��� 
        SELECT * FROM book
        WHERE bookPrice BETWEEN 20000 AND 25000;
        
   -- 10. ���� ���̺��� ���ڸ� '�浿'�� ��� ���� �ʴ� ������ ������, ���� ���
        SELECT bookName, bookAuthor FROM book
        WHERE bookAuthor NOT LIKE ('%�浿%');
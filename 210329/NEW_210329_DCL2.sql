     -- newUser�� �����ؼ�
     -- �ٸ� ����� �������� HR ������ ���̺��� ��������
     -- ���̺� ��ȸ ������ ��� ������ �� �� ����
     
     
     -- ��ü ���� �ο�
     -- newUser���� HR ������ employees ���̺��� ��ȸ�� �� �ִ� ���� �ο�
     -- GRANT �������� ON ��Ű��.���̺� TO �����
     GRANT select ON HR.employees TO newUser;
     
     
     -- ����ڿ��� �ο��� �� ��ȸ
    SELECT * FROM USER_ROLE_PRIVS;
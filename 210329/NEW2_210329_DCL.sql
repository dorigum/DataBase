    SHOW USER;
    
    -- ���� �����Ǿ� �ִ� ���� ��ȸ
    -- DBA �������� ��ȸ (DBA ������ ���� ����ڰ� ��ȸ�ϸ� ���� �߻�)
    SELECT * FROM DBA_USERS;
    
    
    -- DBA ���Ѻ��� ���� ��� ����� �������� ����� ��� ��ȸ
    SELECT * FROM ALL_USERS;
    
    
    -- ��� ����ڿ��� �ο��� �� ��ȸ : ������ �������� ��ȸ
     SELECT grantee, granted_role FROM DBA_ROLE_PRIVS;
     
     
     -- ���� ����� �������� ��ȸ (���� ����ڸ� ��ȸ)
     SELECT * FROM USER_USERS;
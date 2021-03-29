
    -- ���� ���
    -- ���� ����
        -- ����� ���� ���� / ��ȸ / ����
        -- ���� ��� / ����
    -- ���� ���� : ���� �� �� �ο� / ����
    -- ��� �� ����
    -- SQL plus ����
        -- ����
        -- ���̺� ��ȸ
        -- ��� / ����
        -- �� ��Ʈ ����
        
        -- ����� ���� ����
        CREATE USER newUser IDENTIFIED BY "1234"
            DEFAULT TABLESPACE USERS
            TEMPORARY TABLESPACE TEMP;
            QUOTA 10M ON USERS;
            
        -- ����ڿ��� �� �ο�
        -- connect, resource 2����
        GRANT connect, resource TO newUser;
        
        
        -- ����� ���� ���� �� ���̺� �����̽� �Ҵ緮 ����
        ALTER USER newUser QUOTA unlimited ON USERS;
        
        
        -- newUser�� �Ҵ緮�� 50M���� ����
        ALTER USER newUser QUOTA 50M ON USERS;
        
        
        -- ����� ���� ������ �� ���̺� �����̽� �Ҵ緮 ����
        CREATE USER newUser2 IDENTIFIED BY 1234
            DEFAULT TABLESPACE USERS
            TEMPORARY TABLESPACE TEMP
            QUOTA 10M ON USERS;
            
            
        -- newUser2���� connect, resource 2���� �� �ο�
        GRANT connet, resource TO newUser2;
                
        
        -- ����� ���� ���� ����
        -- ��й�ȣ�� 1111�� ����
        ALTER USER newUser2 IDENTIFIED BY 1111;
        
        
        -- ���� ����� ��ȸ
        SHOW USER;
        
        
        -- ���� �����Ǿ� �ִ� ���� ��ȸ
        -- DBA �������� ��ȸ (DBA ������ ���� ����ڰ� ��ȸ�ϸ� ���� �߻�)
        SELECT * FROM DBA_USERS;
        
        -- DBA ���Ѻ��� ���� ��� ����� �������� ����� ��� ��ȸ
        SELECT * FROM ALL_USERS;
        
        -- ���� ����� �������� ��ȸ (���� ����ڸ� ��ȸ)
        SELECT * FROM USER_USERS;
        
        -- DBA �������� DB ��ü�� ��� ��ü�� ���� ���� ��ȸ
        SELECT * FROM DBA_TABLES;
        
        -- ���� ����� �ڽ��� ������ ��ü�� �ٸ� ����ڰ� ���� ��ü �߿���
        -- �ڽſ��� �ο��� �������� �� �� �ִ� ���� ��ȸ
        SELECT * FROM ALL_TABLES;
        
        -- �ڽ��� ������ ��� ��ü�� ���� ���� ��ȸ
        SELECT * FROM USER_TABLES;
        
        
        -- ����� ���� ���� : ���� �����ϰ� �ִ� ����� ������ ������ �� ����
        DROP USER newUser; -- ����
        DROP USER newUser2; -- ���� ���� ���̶� ���� �� ���� �߻�
        -- cannot drop a user that is currently connected
        
        DROP USER newUser2 CASCADE; -- ���� ���Ǳ��� ����
        -- ���� ���� ���̶� ���� �� ���� �߻�
        
        
        
        -- ����� ���� ���
        -- HR ���� ���
        ALTER USER HR ACCOUNT LOCK;
        
        
        -- HR ���� ��� ����
        ALTER USER HR ACCOUNT UNLOCK;
        
        
        
     -- ��ü ���� �ο�
     -- newUser���� HR ������ employees ���̺��� ��ȸ�� �� �ִ� ���� �ο�
     -- GRANT �������� ON ��Ű��.���̺� TO �����
     GRANT select ON HR.employees TO newUser;
     
     -- newUser���� select ���Ѹ� �ο��� ����
     -- �����͸� ����(update)�� ������ �����Ƿ� ������ ���� �� ���� �߻�
     -- update ������ �ο��ؾ߸� �����͸� ������ �� ����
     
     -- newUser���� HR ������ employees ���̺��� ������ �� �ִ� ���� �ο�
     GRANT update ON HR.employees TO newUser;
     -- Ŀ�� ����
     
     
     
     -- select ���� ����
     REVOKE select ON HR.employees FROM newUser;
     -- employees ���̺��� ���̱�� ������ �����ʹ� ��ȸ �Ұ�
     
     
     -- newUser�� ���� connect, resource �� ����
     REVOKE connect, resource FROM newUser;
     
     -- newUser���� connect, resource, dba �� �ο�
     GRANT connect, resource, dba TO newUser;
     
     
     -- ��� ����ڿ��� �ο��� �� ��ȸ : ������ �������� ��ȸ
     SELECT grantee, granted_role FROM DBA_ROLE_PRIVS;
     
     SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'CONNECT';
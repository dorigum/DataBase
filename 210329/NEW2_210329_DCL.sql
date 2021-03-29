    SHOW USER;
    
    -- 현재 생성되어 있는 계정 조회
    -- DBA 권한으로 조회 (DBA 권한이 없는 사용자가 조회하면 오류 발생)
    SELECT * FROM DBA_USERS;
    
    
    -- DBA 권한보다 낮은 모든 사용자 권한으로 사용자 목록 조회
    SELECT * FROM ALL_USERS;
    
    
    -- 모든 사용자에게 부여된 롤 조회 : 관리자 권한으로 조회
     SELECT grantee, granted_role FROM DBA_ROLE_PRIVS;
     
     
     -- 현재 사용자 권한으로 조회 (현재 사용자만 조회)
     SELECT * FROM USER_USERS;
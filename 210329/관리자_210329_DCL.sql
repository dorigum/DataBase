
    -- 관리 기능
    -- 계정 관리
        -- 사용자 계정 생성 / 조회 / 삭제
        -- 계정 잠금 / 해제
    -- 권한 관리 : 권한 및 롤 부여 / 제거
    -- 백업 및 복구
    -- SQL plus 사용법
        -- 접속
        -- 테이블 조회
        -- 백업 / 복구
        -- 웹 포트 변경
        
        -- 사용자 계정 생성
        CREATE USER newUser IDENTIFIED BY "1234"
            DEFAULT TABLESPACE USERS
            TEMPORARY TABLESPACE TEMP;
            QUOTA 10M ON USERS;
            
        -- 사용자에게 롤 부여
        -- connect, resource 2가지
        GRANT connect, resource TO newUser;
        
        
        -- 사용자 계정 생성 후 테이블 스페이스 할당량 지정
        ALTER USER newUser QUOTA unlimited ON USERS;
        
        
        -- newUser의 할당량을 50M으로 변경
        ALTER USER newUser QUOTA 50M ON USERS;
        
        
        -- 사용자 계정 생성할 때 테이블 스페이스 할당량 지정
        CREATE USER newUser2 IDENTIFIED BY 1234
            DEFAULT TABLESPACE USERS
            TEMPORARY TABLESPACE TEMP
            QUOTA 10M ON USERS;
            
            
        -- newUser2에게 connect, resource 2가지 롤 부여
        GRANT connet, resource TO newUser2;
                
        
        -- 사용자 계정 정보 변경
        -- 비밀번호를 1111로 변경
        ALTER USER newUser2 IDENTIFIED BY 1111;
        
        
        -- 현재 사용자 조회
        SHOW USER;
        
        
        -- 현재 생성되어 있는 계정 조회
        -- DBA 권한으로 조회 (DBA 권한이 없는 사용자가 조회하면 오류 발생)
        SELECT * FROM DBA_USERS;
        
        -- DBA 권한보다 낮은 모든 사용자 권한으로 사용자 목록 조회
        SELECT * FROM ALL_USERS;
        
        -- 현재 사용자 권한으로 조회 (현재 사용자만 조회)
        SELECT * FROM USER_USERS;
        
        -- DBA 권한으로 DB 전체의 모든 객체에 대한 정보 조회
        SELECT * FROM DBA_TABLES;
        
        -- 현재 사용자 자신이 생성한 객체와 다른 사용자가 만든 객체 중에서
        -- 자신에게 부여된 권한으로 볼 수 있는 정보 조회
        SELECT * FROM ALL_TABLES;
        
        -- 자신이 생성한 모든 객체에 대한 정보 조회
        SELECT * FROM USER_TABLES;
        
        
        -- 사용자 계정 삭제 : 현재 접속하고 있는 사용자 계정은 삭제할 수 없음
        DROP USER newUser; -- 삭제
        DROP USER newUser2; -- 현재 접속 중이라서 삭제 시 오류 발생
        -- cannot drop a user that is currently connected
        
        DROP USER newUser2 CASCADE; -- 제약 조건까지 삭제
        -- 현재 접속 중이라서 삭제 시 오류 발생
        
        
        
        -- 사용자 계정 잠금
        -- HR 계정 잠금
        ALTER USER HR ACCOUNT LOCK;
        
        
        -- HR 계정 잠금 해제
        ALTER USER HR ACCOUNT UNLOCK;
        
        
        
     -- 객체 권한 부여
     -- newUser에게 HR 계정의 employees 테이블을 조회할 수 있는 권한 부여
     -- GRANT 권한유형 ON 스키마.테이블 TO 사용자
     GRANT select ON HR.employees TO newUser;
     
     -- newUser에게 select 권한만 부여한 상태
     -- 데이터를 수정(update)할 권한이 없으므로 데이터 수정 시 오류 발생
     -- update 권한을 부여해야만 데이터를 수정할 수 있음
     
     -- newUser에게 HR 계정의 employees 테이블을 수정할 수 있는 권한 부여
     GRANT update ON HR.employees TO newUser;
     -- 커밋 성공
     
     
     
     -- select 권한 제거
     REVOKE select ON HR.employees FROM newUser;
     -- employees 테이블이 보이기는 하지만 데이터는 조회 불가
     
     
     -- newUser로 부터 connect, resource 롤 제거
     REVOKE connect, resource FROM newUser;
     
     -- newUser에게 connect, resource, dba 롤 부여
     GRANT connect, resource, dba TO newUser;
     
     
     -- 모든 사용자에게 부여된 롤 조회 : 관리자 권한으로 조회
     SELECT grantee, granted_role FROM DBA_ROLE_PRIVS;
     
     SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'CONNECT';
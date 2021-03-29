     -- newUser로 접속해서
     -- 다른 사용자 계정에서 HR 계정의 테이블을 열었더니
     -- 테이블 조회 권한이 없어서 내용을 볼 수 없음
     
     
     -- 객체 권한 부여
     -- newUser에게 HR 계정의 employees 테이블을 조회할 수 있는 권한 부여
     -- GRANT 권한유형 ON 스키마.테이블 TO 사용자
     GRANT select ON HR.employees TO newUser;
     
     
     -- 사용자에게 부여된 롤 조회
    SELECT * FROM USER_ROLE_PRIVS;

    -- 오라클을 설치하고 나면
    -- 기본적으로 DBA 롤이 부여된 SYS, SYSTEM 계정이 생성
    
    -- SYS 계정
    -- Oracle DB 관리자로 Super user
    -- Oracle 시스템을 유지, 관리, 생성하기 위한 모든 권한을 갖는 계정
    -- DB 생성 / 삭제 가능
    -- SYSDBA 권한을 가짐
    
    -- SYSTEM 계정
    -- 생성된 DB를 운영, 관리하기 위한 관리자 계정
    -- SYS와 유사한 권한을 가지고 있지만, DB 생성과 삭제는 불가
    -- SYSOPER 권한 (운영)
    
    
    -- 명령 프롬프트 창(cmd) 에서 SQL command Line 실행
    -- sqlplus system/1234;
    -- sqlplus 계정명/비밀번호;
    -- SYS 계정으로 로그인 : sqlplus / as sysdba
    -- show user
    -- exit
    
    -- 연결 방법 : SQL > conn newuser/1234
    -- 테이블 조회 : select table_name from tabs;
    -- select * from tab;
    

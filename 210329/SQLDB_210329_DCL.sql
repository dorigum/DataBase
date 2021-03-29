    -- 관리 계정이 아닐 경우 자신이 생성한 객체에 대한 정보 조회 방법 3가지
    
    -- KDYUSER1 자신이 생성한 모든 객체에 대한 정보 조회
        SELECT * FROM USER_TABLES;
        
    
    -- 현재 사용자 자신이 생성한 객체와 다른 사용자가 만든 객체 중에서
    -- 자신에게 부여된 권한으로 볼 수 있는 정보 조회
        SELECT * FROM ALL_TABLES;
        
        
    -- 자신이 소유하고 있는 DB 확인   
        SELECT * FROM TAB;
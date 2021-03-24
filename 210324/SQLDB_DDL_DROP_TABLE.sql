    /* 
    (1) 테이블 생성 : CREATE 문
    (2) 테이블 수정  : ALTER 문
    (3) 테이블 수정 : DROP TABLE 문
    */
    
    
    /*
        DROP TABLE 문 : 테이블 구조와 데이터를 모두 삭제
        -PURGE : 복구 가능한 임시 테이블을 생성하지 않고 삭제
        -CASCADE CONSTRAINT : 제약조건을 무시하고 기준 테이블을 강제 삭제 (권장하지 않음)
    */
    
    
    -- department 테이블 삭제
    -- 외래키로 참조하고 있는 테이블 존재하면 에러 발생
    DROP TABLE  department;
    
    -- department 테이블 삭제
    -- 외래키 관계를 무시하고 기준 테이블을 강제 삭제
    DROP TABLE department CASCADE CONSTRAINTS;
    
    -- product 테이블 삭제
    DROP TABLE product;

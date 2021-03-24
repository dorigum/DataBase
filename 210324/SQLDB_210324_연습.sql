
/*
    연습 문제
    
    1. 고객 테이블 (customer) 생성 
    2. 주문 테이블 (orderProduct) 생성 (이미 생성된 상품(product) 테이블에 대한 주문)
    3. 고객 테이블의 전화번호 열을 NOT NULL로 변경
    4. 고객 테이블에 ‘성별’, ‘나이’ 열 추가
    5. 고객, 주문 테이블에 데이터 삽입 (3개씩)
    6. 주문 테이블에서 상품번호가 2인 행의 주문수량을 3으로 수정
*/

    SELECT * FROM PRODUCT;

    -- 1. 고객 테이블 (customer) 생성 
        CREATE TABLE customer (
            custNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            custName VARCHAR2(30),
            custPhone VARCHAR2(13),
            custAddress VARCHAR2(50)
        );
        
        
    -- 2. 주문 테이블 (orderProduct) 생성 (이미 생성된 상품(product) 테이블에 대한 주문)
    -- 주문번호, 주문일, 주문수량, 고객번호, 상품번호
        CREATE TABLE orderProduct (
            ordNo VARCHAR2(10) NOT NULL PRIMARY KEY,
            ordDate DATE,
            ordQty NUMBER(3),
            custNo VARCHAR2(10) NOT NULL,
            prdNo VARCHAR2(4) NOT NULL,
            CONSTRAINT FK_orderProduct_customer FOREIGN KEY (custNo) REFERENCES customer (custNo),
            CONSTRAINT FK_orderProduct_product FOREIGN KEY (prdNo) REFERENCES product (prdNo)
        );
        
        
    -- 3. 고객 테이블의 전화번호 열을 NOT NULL로 변경
          ALTER TABLE customer MODIFY custPhone VARCHAR2(13) NOT NULL;
    
    
    -- 4. 고객 테이블에 ‘성별’, ‘나이’ 열 추가
         ALTER TABLE customer ADD (custGender VARCHAR(3), custAge NUMBER(3));
    
    
    -- 5. 고객, 주문 테이블에 데이터 삽입 (3개씩)
        INSERT INTO customer VALUES ('1001', '홍길동', '010-1111-1111', '경기', '남', 20);
        INSERT INTO customer VALUES ('1002', '이몽룡', '010-2222-2222', '서울', '남', 30);
        INSERT INTO customer VALUES ('1003', '성춘향', '010-3333-3333', '서울', '여', 25);
        
        SELECT * FROM CUSTOMER;
        SELECT * FROM PRODUCT;
        SELECT * FROM ORDERPRODUCT;
    
        INSERT INTO orderProduct VALUES ('1', '2021-01-01', 3, '1003', '10');
        INSERT INTO orderProduct VALUES ('2', '2020-02-22', 10, '1002', '2');
        INSERT INTO orderProduct VALUES ('3', '2021-03-01', 1, '1001', '5');
        INSERT INTO orderProduct VALUES ('4', '2021-03-01', 1, '1001', '2');
    
    
    -- 6. 주문 테이블에서 상품번호가 2인 행의 주문수량을 3으로 수정
        UPDATE orderProduct SET ordQty =3 WHERE prdNo = '2';

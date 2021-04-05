### DB 전용 클래스 생성

1. 싱글톤 패턴 이용 : 객체가 한 개만 생성

   - DB 연결 과정이 부하가 가장 심하기 때문에
   - 한 번 생성된 연결 객체 계속 사용
     

2. ```Connection``` 객체 생성해서 반환하는 메소드

   - ```getConnection()``` : ``con`` 객체 반환

3. 자원 반환 메소드 ``close()``

   - 자원 수에 따라 ``close()`` 메소드 오버로딩

     

1. **도서 등록**

   - ``BookInsertView insert()``
   - ``Controller``에 ``insert()`` 추가
   - ``BookDAO insert()`` 추가
   - 메뉴에서 ``BookInsertView insert()`` 호출

   

2. **도서 정보 조회**

   - ``BookListView getAllBook()``
- ``Controller``에 ``getAllinsert()`` 추가
   - ``BookDAO updateBook()`` 추가
- 메뉴에서 ``BookListView getAllBook()`` 호출
   

   
3. **도서 정보 수정**

   1. ``BookUpdateView updateBook()``
   2. ``Controller``에 ``updateBook()`` 추가
   3. ``BookDAO updateBook()`` 추가
   4. 메뉴에서 ``BookUpdateView updateBook()`` 호출
      

4. **도서 정보 삭제**

   1. ``BookDeleteView delete()``
   2. ``Controller``에 ``delete()`` 추가
   3. ``BookDAO delete()`` 추가
   4. 메뉴에서 ``BookDeleteView delete()`` 호출
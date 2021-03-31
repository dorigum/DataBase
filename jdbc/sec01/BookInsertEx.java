package jdbc.sec01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BookInsertEx {

	public static void main(String[] args) {


		try {
			// OracleDriver 클래스의 객체 생성 : 런타임 시 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 연결 주소, 사용자 계정, 패스워드 문자열로 설정
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "KDYUSER2";
			String pwd = "1234";
			
			// DB 연결하기 위한 객체
			// DriverManager를 통해 Connection 객체 생성
			// getConnection() 메소드 호출하고 개체 받기
			// 매개변수 : url, user, pwd
			Connection con = DriverManager.getConnection(url, user, pwd);
			
			// 객체가 생성되면 DB연결 성공
			if(con != null) {
				System.out.println("DB연결 성공");
			}
			
			/* 연결 완료 */
			// insert 구문 실행
			
			// 쿼리 전송을 위한 Statement 객체 생성
			Statement stmt = con.createStatement();
			
			// insert 쿼리문 작성  : 1행 추가
			// java에서 실행한 DML 구문은 자동 COMMIT 처리
			String sql = "insert into book values('112233', '자바', '김자바', 10000, '2021-03-02', 5, '2')";
			// book 테이블 확인하기★★★★★★★★
			
			// 쿼리문 실행 executeUpdate() 사용 : insert, update, delete
			// 영향을 받은 행의 수 반환
			int result = stmt.executeUpdate(sql);
			
			// insert 실패인 경우 0 리턴
			// 영향 받은 수 반환 : 1행이 영향을 받음
			if(result > 0)
				System.out.println("도서 정보 등록 성공!!!");
			
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("오류 발생");
			e.printStackTrace();
			
		}

	}

}

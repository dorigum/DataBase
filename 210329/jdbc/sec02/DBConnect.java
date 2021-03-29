package jdbc.sec02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 데이터베이스 연결 전용 클래스

public class DBConnect {
	// 싱글톤 패턴 이용 : 객체 한개만 생성
	private static Connection con;

	// Connection 객체 생성해서 반환하는 메소드
	public static Connection getConnection() {
		// 연결 정보 문자열 생성
		// 연결 주소, 사용자 계정, 패스워드 문자열로 설정
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "KDYUSER2";
		String pwd = "1234";

		// Connection 객체 생성
		// Class.forName("oracle.jdbc.driver.OracleDriver");
		// JDBC 4.0 부터는 자동 로드
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}

		return con;
	}

	// 자원 반환 메소드
	// 반환되는 자원에 따라 다르게 메소드 오버로딩
	// Connection, PreparedStatement, ResultSet 자원 3개 반환 close() 메소드
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
			try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			
			if(con != null) {
				con.close();
				con = null;
			}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	// 반환되는 자원에 따라 다르게 메소드 오버로딩
	// Connection, PreparedStatement, ResultSet 자원 2개 반환 close() 메소드
	public static void close(Connection con, PreparedStatement pstmt) {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}

				if (con != null) {
					con.close();
					con = null;
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
}

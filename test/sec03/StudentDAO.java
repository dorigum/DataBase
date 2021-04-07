package test.sec03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 사용자 데이터 입력 -> DTO -> DAO(DB연결) -> DB저장

public class StudentDAO {
	// 싱글톤으로 할 경우
	private static StudentDAO instance = new StudentDAO();

	private StudentDAO() {
	}

	public static StudentDAO getInstance() {
		return instance;
	}

	// DB 연결 메소드
	// 데이터베이스 연결 후 Connection 객체 반환
	public Connection getConnection() {
		Connection con = null;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "Student";
		String pwd = "1234";

		try {
			con = DriverManager.getConnection(url, user, pwd);

		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}

		return con;
	}

	// 데이터 저장할 메소드 : insertStudent()
	public void insertStudent(StudentDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection(); // DB연결
			if (con != null) {
				System.out.println("insert DB 연결 성공");
			}

			// 쿼리문 작성
			String sql = "insert into student values (?, ?, ?, ?, ?)";
			// 쿼리 전송을 위한 PreparedStatement 객체 생성
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getDet());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getTel());

			// 쿼리문 실행 (영향을 받은 행의 수 반환)
			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("학생 정보 등록 성공");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 데이터 출력할 메소드 : printAllStudent()
	public void printAllStudent() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// 쿼리문 작성
			String sql = "select * from student";
			// 쿼리 전송을 위한 PreparedStatement 객체 생성
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// ResultSet의 next() 메소드 사용해서 한 행씩 데이터 추출
			// 반복문 사용
			while (rs.next()) {
				int no = rs.getInt(1);
				String name = rs.getString(2);
				String det = rs.getString(3);
				String addr = rs.getString(4);
				String tel = rs.getString(5);

				// 한 행씩 출력
				System.out.format("%d\t %s\t %s\t %s\t %s", no, name, det, addr, tel);
				System.out.println();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("오류 발생");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}

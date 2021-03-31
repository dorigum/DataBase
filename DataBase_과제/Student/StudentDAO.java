package Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class StudentDAO {
	
	public void insertStudent(StudentDTO studentDTO) {
		// 실습 1번 테이블에 레코드가 insert 되도록 적당한 JDBC 코드로 채우세요.
		
		// insert
		Scanner sc = new Scanner(System.in);

		System.out.println("학생 정보 등록");
		System.out.print("학번 입력 : ");
		int No = sc.nextInt();

		sc.nextLine();

		System.out.print("성명 입력 : ");
		String name = sc.nextLine();

		System.out.print("전공 입력 : ");
		String det = sc.nextLine();

		System.out.print("주소 입력 : ");
		String addr = sc.nextLine();

		System.out.print("전화번호 입력 : ");
		String tel = sc.nextLine();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "Student";
			String pwd = "1234";

			Connection con = DriverManager.getConnection(url, user, pwd);

			if (con != null) {
				System.out.println("DB가 연결되었습니다.");
			}

			Statement stmt = con.createStatement();

			String sql = String.format(
					"insert into student(No, name, det, addr, tel) values('%d', '%s', '%s', '%s', '%s')", No, name, det,
					addr, tel);

			int result = stmt.executeUpdate(sql);

			if (result > 0)
				System.out.println("학생 정보가 등록되었습니다!");

		} catch (Exception e) {
			System.out.println("오류 발생");
			e.printStackTrace();

		}
	}

	
	
	
	// select
	public void printAllStudents() {
		// 실습 1번 테이블의 모든 레코드가 조회되고 출력되도록 적당한 JDBC 코드로 채우세요.
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");

				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "Student";
				String pwd = "1234";

				Connection con = DriverManager.getConnection(url, user, pwd);

				if (con != null) {
					System.out.println("DB가 연결되었습니다.");
				}

				Statement stmt = con.createStatement();

				String sql = "select * from student order by No";
	
				ResultSet rs = stmt.executeQuery(sql);
				
				System.out.println("학생 정보 조회");
				System.out.println("학번 \t\t 성명 \t\t 전공 \t 주소 \t\t\t\t\t 전화번호");

				
				while (rs.next()) {
				int No = rs.getInt(1);
				String name = rs.getString(2);
				String det = rs.getString(3);
				String addr = rs.getString(4);
				String tel = rs.getString(5);
	
				System.out.format("%-10d\t %-25s\t %-10s %6s %13s", No, name, det, addr, tel);
				
				System.out.println();

			}
				rs.close();
				stmt.close();
				con.close();
				
			} catch (Exception e) {
				System.out.println("오류 발생");
				e.printStackTrace();
		}
	}
}
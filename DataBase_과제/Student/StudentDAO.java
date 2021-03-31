package Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class StudentDAO {
	
	public void insertStudent(StudentDTO studentDTO) {
		// �ǽ� 1�� ���̺� ���ڵ尡 insert �ǵ��� ������ JDBC �ڵ�� ä�켼��.
		
		// insert
		Scanner sc = new Scanner(System.in);

		System.out.println("�л� ���� ���");
		System.out.print("�й� �Է� : ");
		int No = sc.nextInt();

		sc.nextLine();

		System.out.print("���� �Է� : ");
		String name = sc.nextLine();

		System.out.print("���� �Է� : ");
		String det = sc.nextLine();

		System.out.print("�ּ� �Է� : ");
		String addr = sc.nextLine();

		System.out.print("��ȭ��ȣ �Է� : ");
		String tel = sc.nextLine();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "Student";
			String pwd = "1234";

			Connection con = DriverManager.getConnection(url, user, pwd);

			if (con != null) {
				System.out.println("DB�� ����Ǿ����ϴ�.");
			}

			Statement stmt = con.createStatement();

			String sql = String.format(
					"insert into student(No, name, det, addr, tel) values('%d', '%s', '%s', '%s', '%s')", No, name, det,
					addr, tel);

			int result = stmt.executeUpdate(sql);

			if (result > 0)
				System.out.println("�л� ������ ��ϵǾ����ϴ�!");

		} catch (Exception e) {
			System.out.println("���� �߻�");
			e.printStackTrace();

		}
	}

	
	
	
	// select
	public void printAllStudents() {
		// �ǽ� 1�� ���̺��� ��� ���ڵ尡 ��ȸ�ǰ� ��µǵ��� ������ JDBC �ڵ�� ä�켼��.
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");

				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "Student";
				String pwd = "1234";

				Connection con = DriverManager.getConnection(url, user, pwd);

				if (con != null) {
					System.out.println("DB�� ����Ǿ����ϴ�.");
				}

				Statement stmt = con.createStatement();

				String sql = "select * from student order by No";
	
				ResultSet rs = stmt.executeQuery(sql);
				
				System.out.println("�л� ���� ��ȸ");
				System.out.println("�й� \t\t ���� \t\t ���� \t �ּ� \t\t\t\t\t ��ȭ��ȣ");

				
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
				System.out.println("���� �߻�");
				e.printStackTrace();
		}
	}
}
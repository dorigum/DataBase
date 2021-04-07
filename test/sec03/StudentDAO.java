package test.sec03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// ����� ������ �Է� -> DTO -> DAO(DB����) -> DB����

public class StudentDAO {
	// �̱������� �� ���
	private static StudentDAO instance = new StudentDAO();

	private StudentDAO() {
	}

	public static StudentDAO getInstance() {
		return instance;
	}

	// DB ���� �޼ҵ�
	// �����ͺ��̽� ���� �� Connection ��ü ��ȯ
	public Connection getConnection() {
		Connection con = null;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "Student";
		String pwd = "1234";

		try {
			con = DriverManager.getConnection(url, user, pwd);

		} catch (SQLException e) {
			System.out.println("DB ���� ����");
			e.printStackTrace();
		}

		return con;
	}

	// ������ ������ �޼ҵ� : insertStudent()
	public void insertStudent(StudentDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection(); // DB����
			if (con != null) {
				System.out.println("insert DB ���� ����");
			}

			// ������ �ۼ�
			String sql = "insert into student values (?, ?, ?, ?, ?)";
			// ���� ������ ���� PreparedStatement ��ü ����
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getDet());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getTel());

			// ������ ���� (������ ���� ���� �� ��ȯ)
			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("�л� ���� ��� ����");

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

	// ������ ����� �޼ҵ� : printAllStudent()
	public void printAllStudent() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			// ������ �ۼ�
			String sql = "select * from student";
			// ���� ������ ���� PreparedStatement ��ü ����
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// ResultSet�� next() �޼ҵ� ����ؼ� �� �྿ ������ ����
			// �ݺ��� ���
			while (rs.next()) {
				int no = rs.getInt(1);
				String name = rs.getString(2);
				String det = rs.getString(3);
				String addr = rs.getString(4);
				String tel = rs.getString(5);

				// �� �྿ ���
				System.out.format("%d\t %s\t %s\t %s\t %s", no, name, det, addr, tel);
				System.out.println();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("���� �߻�");
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

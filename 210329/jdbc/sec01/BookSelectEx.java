package jdbc.sec01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class BookSelectEx {

	public static void main(String[] args) {
		// DB����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "KDYUSER2";
			String pwd = "1234";

			Connection con = DriverManager.getConnection(url, user, pwd);

			// ��ü�� �����Ǹ� DB���� ����
			if (con != null) {
				System.out.println("DB���� ����");
			}
			/* DB���� ���� ���� */

			/* ���� ���� */
			// select�� ����ؼ� ���� ���� ��ȸ
			// ������ ������ ���� Statement ��ü ����
			// Connection �������̽��� crateStatement() �޼ҵ带 ����ؼ� ��ü ����
			Statement stmt = con.createStatement();

			// select ������ �ۼ�
			String sql = "select * from book order by bookNo";
			// ������ ����� �� ��� �޾ƿ���
			// select �����̹Ƿ� executeQuery() �޼ҵ� ���
			// ����� ResultSet ��ü�� ��ȯ
			ResultSet rs = stmt.executeQuery(sql); // select ������ executeQuery() ���
			
			System.out.println("���� ���� ��ȸ");
			System.out.println("������ȣ \t ������ \t\t\t\t ���� \t\t ���� \t\t ������ \t\t��� \t\t���ǻ��ȣ");

			// executeQuery() ���� ����� �޾ƿ� ResultSet���� ������ ����
			// ResultSet�� next() �޼ҵ带 �̿��ؼ�
			// ���� Ŀ���� �������� �̵��ذ��� �� ���� �����͸� ���̵��� ��
			// next() �޼ҵ� : Ŀ���� �̵��ϸ鼭 ���� �� ����
			// ���� ���� ������ true�� ��ȯ�ϰ�, ������ false ��ȯ
			// ��� ���� ���������� �ݺ����� ���
			// ������ ���� : ������ Ÿ�Կ� ���� getXXX() �޼ҵ� ���
			// ���ڿ� : getString()
			// ���� : getInt()
			// ��¥ : getDate()
			while (rs.next()) { // ���� ���� �����Ѵٸ�
				String bookNo = rs.getNString(1);
				String bookName = rs.getNString(2);
				String bookAuthor = rs.getNString(3);
				int bookPrice = rs.getInt(4);
				Date bookDate = rs.getDate(5);
				int bookStock = rs.getInt(6);
				String pubNo = rs.getNString(7);

				// �� �྿ ���
				System.out.format("%-10s\t %-25s\t %-10s %6d %13s \t%3d %10s",
						bookNo, bookName, bookAuthor, bookPrice, bookDate, bookStock, pubNo);
				
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

package jdbc.sec01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BookInsertEx {

	public static void main(String[] args) {


		try {
			// OracleDriver Ŭ������ ��ü ���� : ��Ÿ�� �� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// ���� �ּ�, ����� ����, �н����� ���ڿ��� ����
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "KDYUSER2";
			String pwd = "1234";
			
			// DB �����ϱ� ���� ��ü
			// DriverManager�� ���� Connection ��ü ����
			// getConnection() �޼ҵ� ȣ���ϰ� ��ü �ޱ�
			// �Ű����� : url, user, pwd
			Connection con = DriverManager.getConnection(url, user, pwd);
			
			// ��ü�� �����Ǹ� DB���� ����
			if(con != null) {
				System.out.println("DB���� ����");
			}
			
			/* ���� �Ϸ� */
			// insert ���� ����
			
			// ���� ������ ���� Statement ��ü ����
			Statement stmt = con.createStatement();
			
			// insert ������ �ۼ�  : 1�� �߰�
			// java���� ������ DML ������ �ڵ� COMMIT ó��
			String sql = "insert into book values('112233', '�ڹ�', '���ڹ�', 10000, '2021-03-02', 5, '2')";
			// book ���̺� Ȯ���ϱ�ڡڡڡڡڡڡڡ�
			
			// ������ ���� executeUpdate() ��� : insert, update, delete
			// ������ ���� ���� �� ��ȯ
			int result = stmt.executeUpdate(sql);
			
			// insert ������ ��� 0 ����
			// ���� ���� �� ��ȯ : 1���� ������ ����
			if(result > 0)
				System.out.println("���� ���� ��� ����!!!");
			
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("���� �߻�");
			e.printStackTrace();
			
		}

	}

}

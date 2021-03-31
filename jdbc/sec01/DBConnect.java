package jdbc.sec01;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public static void main(String[] args) {
		
		try {
			// OracleDriver Ŭ������ ��ü ���� : ��Ÿ�� �� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// ���� �ּ�, ����� ����, �н����� ���ڿ��� ����
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "KDYUSER2"; // �ڡڡڡڡڿ��� Ȯ��!!!
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
			
		} catch (Exception e) {
			System.out.println("���� �߻�");
			e.printStackTrace();
			
		}
	}

}

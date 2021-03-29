package jdbc.sec01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class BookInsertInputEx {

	public static void main(String[] args) {
		// ����� ���� ���� �Է�
		Scanner sc = new Scanner(System.in);
		// ������ȣ ~ ���ǻ��ȣ �Է��ؼ� ������ ����

		System.out.println("���� ���� ���");
		System.out.print("������ȣ �Է� : ");
		String bookNo = sc.nextLine();
		

		System.out.print("������ �Է� : ");
		String bookName = sc.nextLine();
		
		
		System.out.print("���� �Է� : ");
		String bookAuthor = sc.nextLine();
		
		
		System.out.print("�������� �Է� : ");
		int bookPrice = sc.nextInt();
		
		sc.nextLine();
		
		System.out.print("������ �Է� : ");
		String bookDate = sc.nextLine();
		
		
		System.out.print("��� �Է� : ");
		int bookStock = sc.nextInt();
		
		sc.nextLine();
		
		System.out.print("���ǻ��ȣ �Է� : ");
		String pubNo = sc.nextLine();
		
		
		
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
			if (con != null) {
				System.out.println("DB���� ����");
			}

			/* DB���� ���� */
			// �Էµ� ������ insert �۾� ����
			// ���� ������ ���� Statement ��ü ����
			Statement stmt = con.createStatement();
			
			
			// String sql = String.format("insert int book(�� ����Ʈ) values(���� ������)", ���� ����Ʈ);
			// insert ������ �ۼ�
			String sql = String.format("insert into book(bookNo, bookName, bookAuthor, bookPrice, bookDate, bookStock, pubNo) values('%s', '%s', '%s', '%d', '%s', '%d', '%s')",
										bookNo, bookName, bookAuthor, bookPrice, bookDate, bookStock, pubNo);
			
			int result = stmt.executeUpdate(sql);
			
			// ������ ���� (������ ���� ���� �� ��ȯ)
			if(result > 0)
				System.out.println("���� ���� ��� ����!!!");
			
			

		} catch (Exception e) {
			System.out.println("���� �߻�");
			e.printStackTrace();

		}

	}

}

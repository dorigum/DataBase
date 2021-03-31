package jdbc.sec02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class BookDeletePreEx {

	public static void main(String[] args) {
		// DB ����
		Connection con = DBConnect.getConnection();
		PreparedStatement pstmt = null;
		
		// ������ ���� ��ȣ �Է�
		Scanner sc = new Scanner(System.in);
		
		System.out.println("���� ���� ����");
		System.out.print("������ ������ ������ȣ �Է� : ");
		String bookNo = sc.nextLine();
		
		
		try {
			con = DBConnect.getConnection();
			
			// SQL�� �ۼ� - ���� ����
			
			String sql = "delete book where bookNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookNo);
			
			pstmt.executeUpdate();
			
			System.out.println("���� ���� ���� ����!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnect.close(con, pstmt);
		}
	}
}

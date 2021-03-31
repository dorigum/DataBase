package jdbc.sec02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class BookDeletePreEx {

	public static void main(String[] args) {
		// DB 연결
		Connection con = DBConnect.getConnection();
		PreparedStatement pstmt = null;
		
		// 삭제할 도서 번호 입력
		Scanner sc = new Scanner(System.in);
		
		System.out.println("도서 정보 삭제");
		System.out.print("삭제할 도서의 도서번호 입력 : ");
		String bookNo = sc.nextLine();
		
		
		try {
			con = DBConnect.getConnection();
			
			// SQL문 작성 - 쿼리 수행
			
			String sql = "delete book where bookNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookNo);
			
			pstmt.executeUpdate();
			
			System.out.println("도서 정보 삭제 성공!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnect.close(con, pstmt);
		}
	}
}

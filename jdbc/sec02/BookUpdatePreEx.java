package jdbc.sec02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class BookUpdatePreEx {

	public static void main(String[] args) {
		// DB 연결
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 수정할 도서 정보 입력
		Scanner sc = new Scanner(System.in);
		// 도서번호 ~ 출판사번호 입력해서 변수에 저장

		System.out.println("도서 정보 수정");
		System.out.print("수정할 도서의 도서번호 입력 : ");
		String bookNo = sc.nextLine();

		System.out.print("도서명 입력 : ");
		String bookName = sc.nextLine();

		System.out.print("저자 입력 : ");
		String bookAuthor = sc.nextLine();

		System.out.print("도서가격 입력 : ");
		int bookPrice = sc.nextInt();
		
		sc.nextLine();

		System.out.print("발행일 입력 : ");
		String bookDate = sc.nextLine();

		System.out.print("재고 입력 : ");
		int bookStock = sc.nextInt();
		
		sc.nextLine();

		System.out.print("출판사번호 입력 : ");
		String pubNo = sc.nextLine();
		
		
		try {
			con = DBConnect.getConnection();
			
			// SQL문 작성 : update 구문
			// update 테이블 set 열이름 = 값;
			
			String sql = "update book set bookName=?, bookAuthor=?,"
						 + "bookPrice=?, bookDate=?, bookStock=?, pubNo=? where bookNo=?";
			
			pstmt = con.prepareStatement(sql);
			
			// 열의 값 자리에 ?로 처리하고 setXXX() 메소드 사용해서 순서대로 값 설정
			pstmt.setString(1, bookName);
			pstmt.setString(2, bookAuthor);
			pstmt.setInt(3, bookPrice);
			pstmt.setString(4, bookDate);
			pstmt.setInt(5, bookStock);
			pstmt.setString(6, pubNo);
			pstmt.setString(7, bookNo);
			
			
			pstmt.executeUpdate(); // insert, update, delete
			
			System.out.println("도서 정보 수정 성공!");
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnect.close(con,pstmt);
		}
		
		
		

	}

}

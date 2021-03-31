package jdbc.sec01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class BookInsertInputEx {

	public static void main(String[] args) {
		// 등록할 도서 정보 입력
		Scanner sc = new Scanner(System.in);
		// 도서번호 ~ 출판사번호 입력해서 변수에 저장

		System.out.println("도서 정보 등록");
		System.out.print("도서번호 입력 : ");
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
			// OracleDriver 클래스의 객체 생성 : 런타임 시 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 연결 주소, 사용자 계정, 패스워드 문자열로 설정
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "KDYUSER2";
			String pwd = "1234";

			// DB 연결하기 위한 객체
			// DriverManager를 통해 Connection 객체 생성
			// getConnection() 메소드 호출하고 개체 받기
			// 매개변수 : url, user, pwd
			Connection con = DriverManager.getConnection(url, user, pwd);

			// 객체가 생성되면 DB연결 성공
			if (con != null) {
				System.out.println("DB연결 성공");
			}

			/* DB연결 종료 */
			// 입력된 값으로 insert 작업 수행
			// 쿼리 전송을 위한 Statement 객체 생성
			Statement stmt = con.createStatement();
			
			
			// String sql = String.format("insert int book(열 리스트) values(서식 지정자)", 변수 리스트);
			// insert 쿼리문 작성
			String sql = String.format("insert into book(bookNo, bookName, bookAuthor, bookPrice, bookDate, bookStock, pubNo) values('%s', '%s', '%s', '%d', '%s', '%d', '%s')",
										bookNo, bookName, bookAuthor, bookPrice, bookDate, bookStock, pubNo);
			
			int result = stmt.executeUpdate(sql);
			
			// 쿼리문 실행 (영향을 받은 행의 수 반환)
			if(result > 0)
				System.out.println("도서 정보 등록 성공!!!");
			
			

		} catch (Exception e) {
			System.out.println("오류 발생");
			e.printStackTrace();

		}

	}

}

package jdbc.projectEx.view;

import java.util.Scanner;

import jdbc.projectEx.controller.Controller;
import jdbc.projectEx.model.BookDTO;


public class BookInsertView {
	// Controller 클래스가 싱글톤이므로 getInstance() 호출해서 인스턴스 생성
		Controller controller = Controller.getInstance();
		Scanner sc = new Scanner(System.in);
		
		// 데이터 입력
		public void insert() {
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
			
			System.out.print("출판사 번호 입력 : ");
			String pubNo = sc.nextLine();	
			
			System.out.println("***************************");
			
			//Vector에 저장
			/*Vector v = new Vector<String>();
			v.add(bookNo);
			v.add(bookName);
			v.add(bookAuthor);
			v.add(bookPrice);
			v.add(bookDate);
			v.add(bookStock);*/
			
			//Controller에게 입력 받은 데이터 전달
			controller.insert(new BookDTO(bookNo, bookName, bookAuthor,
					bookPrice, bookDate, bookStock, pubNo)); //컨트롤러 클래스에 insert() 아직 안 만들었음
			sc.close();
			
		}
}









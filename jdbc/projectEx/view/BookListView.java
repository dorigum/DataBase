package jdbc.projectEx.view;

import java.util.Vector;

import jdbc.projectEx.controller.Controller;
import jdbc.projectEx.model.BookDTO;

public class BookListView {
	Controller controller = Controller.getInstance();
	
	// Controller에게 요청
	public void getAllBook() {
		controller.getAllBook();
	}
	
	// 컨트롤러로부터 전달된 결과를 출력
	public static void showAllBook(Vector<BookDTO>dataSet) {
		System.out.println("도서 정보 조회");
		System.out.println("-------------------------------------------------");
		System.out.println("도서번호 \t 도서명 \t\t\t\t 저자 \t\t 가격 \t\t 발행일 \t\t재고 \t\t출판사번호");
		System.out.println("-------------------------------------------------");
		
		for(BookDTO dto : dataSet) {
			System.out.println(dto);
			
		}
	}
}

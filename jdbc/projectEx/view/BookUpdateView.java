package jdbc.projectEx.view;

import java.sql.Connection;
import java.util.Scanner;

import jdbc.projectEx.controller.Controller;
import jdbc.projectEx.model.BookDTO;

public class BookUpdateView {
	Controller controller = Controller.getInstance();
	Scanner sc = new Scanner(System.in);

	public void updateBook() {
		System.out.println("도서 정보 수정");

		// 전체 도서 출력
		BookListView bls = new BookListView();
		bls.getAllBook();

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

		// 컨트롤러에게 입력받은 데이터 전달
		controller.update(new BookDTO(bookNo, bookName, bookAuthor,
									bookPrice, bookDate, bookStock, pubNo));

		sc.close();

	}
}

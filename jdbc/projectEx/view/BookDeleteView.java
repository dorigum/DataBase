package jdbc.projectEx.view;

import java.util.Scanner;

import jdbc.projectEx.controller.Controller;

public class BookDeleteView {
	Controller controller = Controller.getInstance();
	Scanner sc = new Scanner(System.in);

	public void delete() {
		System.out.print("도서 정보 삭제");

		BookListView bls = new BookListView();
		bls.getAllBook();

		System.out.print("삭제할 도서의 도서번호 입력 : ");
		String bookNo = sc.nextLine();

		controller.delete(bookNo);

	}
}

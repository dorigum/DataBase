package jdbc.projectEx.view;

import java.util.Vector;

import jdbc.projectEx.controller.Controller;
import jdbc.projectEx.model.BookDTO;

public class BookListView {
	Controller controller = Controller.getInstance();
	
	// Controller���� ��û
	public void getAllBook() {
		controller.getAllBook();
	}
	
	// ��Ʈ�ѷ��κ��� ���޵� ����� ���
	public static void showAllBook(Vector<BookDTO>dataSet) {
		System.out.println("���� ���� ��ȸ");
		System.out.println("-------------------------------------------------");
		System.out.println("������ȣ \t ������ \t\t\t\t ���� \t\t ���� \t\t ������ \t\t��� \t\t���ǻ��ȣ");
		System.out.println("-------------------------------------------------");
		
		for(BookDTO dto : dataSet) {
			System.out.println(dto);
			
		}
	}
}

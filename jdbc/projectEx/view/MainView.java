package jdbc.projectEx.view;

import java.util.Scanner;

public class MainView {

	public static void main(String[] args) {
		// 메뉴 출력
		// 선택된 메뉴에 따라 해당 클래스의 메소드 호출
		Scanner sc = new Scanner(System.in);
		int menuNum;

		System.out.println("***************************");
		System.out.println("\t도서 관리 프로그램");
		System.out.println("***************************");

		System.out.println("\t다음 메뉴에서 선택");
		System.out.println("***************************");
		System.out.println("1. 도서 등록");
		System.out.println("2. 도서 정보 조회");
		System.out.println("3. 도서 정보 수정");
		System.out.println("4. 도서 정보 삭제");
		System.out.println("5. 종료");
		System.out.println("***************************");

		System.out.print("메뉴 번호 입력 : ");
		menuNum = sc.nextInt();

		switch (menuNum) {
		case 1:
			BookInsertView bis = new BookInsertView();
			bis.insert();
			break;

		case 2:
			BookListView bls = new BookListView();
			bls.getAllBook();
			break;

		case 3:
			BookUpdateView buv = new BookUpdateView();
			buv.updateBook();
			break;

		case 4:
			BookDeleteView bdv = new BookDeleteView();
			bdv.delete();
			break;

		case 5:
			break;
		default:
			System.out.print("잘못 입력하였습니다.");

		}

		System.out.println("---------------------------------------");
		System.out.println("종료 합니다");

		sc.close();
	}

}

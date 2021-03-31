package Student;

import java.util.Scanner;

public class StudentTest {
	// StudentTest 클래스의 main 메소드 실행을 통해 다음과 같은 결과가 출력되어야 함.
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int menuNum;

		System.out.println("---------------------------------------");
		System.out.println("\t학생 관리 프로그램");
		System.out.println("---------------------------------------");
		
		System.out.println("\t다음 메뉴에서 선택");
		System.out.println("---------------------------------------");
		System.out.println("1. 학생 등록");
		System.out.println("2. 학생 정보 조회");
		System.out.println("3. 종료");
		System.out.println("---------------------------------------");
		
		System.out.print("메뉴 번호 입력 : ");
		menuNum = sc.nextInt();
		
		
		switch (menuNum) {
		case 1:
			StudentDAO sda = new StudentDAO();
			sda.insertStudent(null);
			break;

		case 2:
			StudentDAO sda2 = new StudentDAO();
			sda2.printAllStudents();
			break;
			
		case 3:
			break;
			
		default:
			System.out.print("잘못 입력하였습니다.");
		}
		
		System.out.println("---------------------------------------");
		System.out.println("종료합니다.");

		sc.close();
		
	}

}
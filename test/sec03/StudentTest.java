package test.sec03;

import java.util.Scanner;

public class StudentTest {

	public static void main(String[] args) {
		StudentDAO dao = StudentDAO.getInstance();
		// 입력 받는 경우
		/*Scanner sc = new Scanner(System.in);
		System.out.println("학생 정보 등록");
		System.out.print("학번 입력 : ");
		int no = sc.nextInt();
		
		sc.nextLine();
		
		System.out.print("성명 입력 : ");
		String name = sc.nextLine();
		
		System.out.print("학과 입력 : ");
		String det = sc.nextLine();
		
		System.out.print("주소 입력 : ");
		String addr = sc.nextLine();
		
		System.out.print("전화번호 입력 : ");
		String tel = sc.nextLine();
		
		// StudentDAO 클래스의 insertStudent() 메소드에게 입력한 값 전달
		dao.insertStudent(new StudentDTO(no, name, det, addr, tel));
		
		sc.close();*/
		
		
		// 생성자 매개변수로 전달하는 경우
		//dao.insertStudent(new StudentDTO(6, "박길동", "경영학과", "대구", "010-6666-6666"));

		System.out.println("*****학생 정보 출력*****");
		dao.printAllStudent();
	}

}

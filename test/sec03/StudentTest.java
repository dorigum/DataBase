package test.sec03;

import java.util.Scanner;

public class StudentTest {

	public static void main(String[] args) {
		StudentDAO dao = StudentDAO.getInstance();
		// �Է� �޴� ���
		/*Scanner sc = new Scanner(System.in);
		System.out.println("�л� ���� ���");
		System.out.print("�й� �Է� : ");
		int no = sc.nextInt();
		
		sc.nextLine();
		
		System.out.print("���� �Է� : ");
		String name = sc.nextLine();
		
		System.out.print("�а� �Է� : ");
		String det = sc.nextLine();
		
		System.out.print("�ּ� �Է� : ");
		String addr = sc.nextLine();
		
		System.out.print("��ȭ��ȣ �Է� : ");
		String tel = sc.nextLine();
		
		// StudentDAO Ŭ������ insertStudent() �޼ҵ忡�� �Է��� �� ����
		dao.insertStudent(new StudentDTO(no, name, det, addr, tel));
		
		sc.close();*/
		
		
		// ������ �Ű������� �����ϴ� ���
		//dao.insertStudent(new StudentDTO(6, "�ڱ浿", "�濵�а�", "�뱸", "010-6666-6666"));

		System.out.println("*****�л� ���� ���*****");
		dao.printAllStudent();
	}

}

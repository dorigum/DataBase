package Student;

import java.util.Scanner;

public class StudentTest {
	// StudentTest Ŭ������ main �޼ҵ� ������ ���� ������ ���� ����� ��µǾ�� ��.
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int menuNum;

		System.out.println("---------------------------------------");
		System.out.println("\t�л� ���� ���α׷�");
		System.out.println("---------------------------------------");
		
		System.out.println("\t���� �޴����� ����");
		System.out.println("---------------------------------------");
		System.out.println("1. �л� ���");
		System.out.println("2. �л� ���� ��ȸ");
		System.out.println("3. ����");
		System.out.println("---------------------------------------");
		
		System.out.print("�޴� ��ȣ �Է� : ");
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
			System.out.print("�߸� �Է��Ͽ����ϴ�.");
		}
		
		System.out.println("---------------------------------------");
		System.out.println("�����մϴ�.");

		sc.close();
		
	}

}
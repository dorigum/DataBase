package jdbc.projectEx.view;

public class ResultView {
	public static void succMsg(String msg) {
		System.out.println("성공 : " + msg);
	}
	
	public static void errorMsg(String msg) {
		System.out.println("실패 : " + msg);
	}
}

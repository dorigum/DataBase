package jdbc.projectEx.controller;

import java.util.Vector;

import jdbc.projectEx.model.BookDAO;
import jdbc.projectEx.model.BookDTO;
import jdbc.projectEx.view.BookListView;
import jdbc.projectEx.view.ResultView;

public class Controller {
	// 싱글톤 (Singleton) 클래스 : 단 하나의 객체만 생성
	private static Controller instance = new Controller();

	// new 연산자로 생성자 호출할 수 없도록 막음
	private Controller() {
	}

	// 외부에서 호출해서 객체 생성할 수 있도록
	// 자신의 객체 (instance) 반환
	public static Controller getInstance() {
		return instance;
	}
	
	BookDAO dao = new BookDAO();
	
	// BookInsertView로부터 받은 데이터를 BookDTO에 저장
	// -> BookDAO에게 전달할 예정
	public void insert(BookDTO newDto) {
		
		try {
			
			/*BookDTO dto = new BookDTO();
			dto.setBookNo(newDto.getBookNo());
			dto.setBookName(newDto.getBookName());
			dto.setBookAuthor(newDto.getBookAuthor());
			dto.setBookPrice(newDto.getBookPrice());
			dto.setBookDate(newDto.getBookDate());
			dto.setBookStock(newDto.getBookStock());
			dto.setPubNo(newDto.getPubNo());*/
			
			// BookDAO에게 전달하고 결과를 받아서
			// 결과에 따라 사용자에게 메시지 전달
			if(dao.insert(newDto)) { // DAO insert()에게 호출하고 결과가 true라면
				ResultView.succMsg("도서 정보가 등록되었습니다");			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ResultView.errorMsg("도서 정보 등록 오류");
		}
	}
	
	// BookListView에서 호출
	public void getAllBook() {
		// BookDAO에게 요청해서 결과를 받음
		try {
			Vector<BookDTO> dataSet = dao.getAllBook();
			
			if(dataSet.size() != 0) {
				BookListView.showAllBook(dataSet);
			} else {
				ResultView.succMsg("검색 결과가 없습니다.");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ResultView.errorMsg("검색에 오류가 있습니다.");
		}
		// 결과를 BookListView에게 전달
	}
	
	public void update(BookDTO newDto) {
		
		try {
		// BookDAO에게 전달하고 결과 받아서 메시지 출력
		if(dao.update(newDto)){
			ResultView.succMsg("도서 정보를 수정하였습니다. 도서 정보 조회해서 확인하세요.");
		}
	
		} catch (Exception e) {
			e.printStackTrace();
			ResultView.errorMsg("도서 정보 수정 오류");
		}
	}
	
	public void delete(String bookNo) {
		// BookDAO에게 전달받은 BookNo 문자열을 그대로 넘겨도 되고
		// dto.setBookNo(bookNo)해서 dto를 넘겨도 됨
		
		try {
		BookDTO dto = new BookDTO();
		dto.setBookNo(bookNo);
		
		if(dao.delete(dto)) {
			ResultView.succMsg(bookNo + "도서를 삭제하였습니다. 도서 정보 조회에서 확인하세요.");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ResultView.errorMsg("도서 정보 삭제 오류");
		}
	}
}


















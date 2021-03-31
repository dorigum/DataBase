package jdbc.projectEx.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;

import jdbc.sec02.DBConnect;

public class BookDAO implements IBookDAO {

	@Override
	public Vector<BookDTO> getAllBook() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Vector<BookDTO> dataSet = null;

		try {
			con = DBConnect.getConnection();

			String sql = "select * from book order by bookNo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			dataSet = new Vector<BookDTO>();

			// select 결과 ResultSet에서 한 행씩 추출해서
			// BookDTO에 담아 Vector에서 추가
			while (rs.next()) {
				dataSet.add(new BookDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getDate(5).toString(), // YYYY-MM-DD만 출력 (이하 시간 제외)
						rs.getInt(6),
						rs.getString(7)));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DBConnect.close(con, pstmt, rs);
		}

		return dataSet;
	}

	@Override
	public boolean insert(BookDTO dto) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBConnect.getConnection();

			String sql = "insert into book values (?, ?, ?, ?, ?, ?, ?)";

			// 쿼리문 전송을 위한 PreparedStatement 객체 생성
			pstmt = con.prepareStatement(sql);

			// 바인딩 변수의 순서는 ?의 순서와 일치해야 함
			// 데이터 타입에 맞춰 저장되어야 하기 때문
			// 시작번호는 1부터
			// 바인딩 변수에 값을 저장하기 위해서는 setXXX() 메소드 사용
			pstmt.setString(1, dto.getBookNo());
			pstmt.setString(2, dto.getBookName());
			pstmt.setString(3, dto.getBookAuthor());
			pstmt.setInt(4, dto.getBookPrice());
			pstmt.setString(5, dto.getBookDate());
			pstmt.setInt(6, dto.getBookStock());
			pstmt.setString(7, dto.getPubNo());

			// insert, update, delete 문에서는 executeUpdate() 메소드 사용
			int result = pstmt.executeUpdate();

			if (result == 0) {
				return false;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
			// 호출한 쪽에서 예외를 처리하라고 예외를 인위적으로 발생시킴
			// 컨트롤러에서 예외를 처리해서 사용자에게 적절한 메시지 전달
		} finally {
			DBConnect.close(con, pstmt);
		}

		return true;
	}

	@Override
	public boolean update(BookDTO dto) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBConnect.getConnection();

			String sql = "update book set bookName=?, bookAuthor=?,"
					+ "bookPrice=?, bookDate=?, bookStock=?, pubNo=? where bookNo=?";

			pstmt = con.prepareStatement(sql);

			// 열의 값 자리에 ?로 처리하고 setXXX() 메소드 사용해서 순서대로 값 설정
			pstmt.setString(1, dto.getBookName());
			pstmt.setString(2, dto.getBookAuthor());
			pstmt.setInt(3, dto.getBookPrice());
			pstmt.setString(4, dto.getBookDate());
			pstmt.setInt(5, dto.getBookStock());
			pstmt.setString(6, dto.getPubNo());
			pstmt.setString(7, dto.getBookNo());

			int result = pstmt.executeUpdate(); // insert, update, delete

			if (result == 0) {
				return false;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DBConnect.close(con, pstmt);
		}

		return true;
	}

	@Override
	public boolean delete(BookDTO dto) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DBConnect.getConnection();

			String sql = "delete book where bookNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBookNo());

			int result = pstmt.executeUpdate();

			if (result == 0) {
				return false;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			DBConnect.close(con, pstmt);
		}

		return true;
	}

}

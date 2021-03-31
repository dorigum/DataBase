package jdbc.projectEx.model;

import java.util.Vector;

public interface IBookDAO {
		public Vector<BookDTO> getAllBook() throws Exception;
		public boolean insert(BookDTO dto) throws Exception;
		public boolean update(BookDTO dto) throws Exception;
		public boolean delete(BookDTO dto) throws Exception;
}

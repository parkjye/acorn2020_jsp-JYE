package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	
	//게시판의 전체 row 갯수 리턴하는 메소드
	public int getCount(){
		//전체 row의 갯수를 담을 지역변수
		int count=0;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			/*
			 * ROWNUM중에서 가장 큰 수 select하면 전체 row의 갯수가 된다.
			 * 만약 row가 하나도 없으면 null을 리턴하기 때문에
			 * null인 경우 0으로 바꿔줘야한다. NVL(max(ROWNUM), 0)
			 */
			String sql = "select NVL(max(ROWNUM), 0) as num"
					+ " from board_file";
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection반납
			} catch (Exception e) {
			}
		}
		return count;
	}
	
	//제목+파일명 검색결과 row 갯수 리턴하는 메소드
	public int getCountTitleFileName(FileDto dto){
		//전체 row의 갯수를 담을 지역변수
		int count=0;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			/*
			 * ROWNUM중에서 가장 큰 수 select하면 전체 row의 갯수가 된다.
			 * 만약 row가 하나도 없으면 null을 리턴하기 때문에
			 * null인 경우 0으로 바꿔줘야한다. NVL(max(ROWNUM), 0)
			 */
			String sql = "select NVL(max(ROWNUM), 0) as num"
					+ " from board_file"
					+ "	where title like '%'|| ? || '%' or orgFileName like '%' || ? || '%'";
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOrgFileName());

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection반납
			} catch (Exception e) {
			}
		}
		return count;
	}
	
	//제목 파일명 검색결과 row 갯수 리턴하는 메소드
	public int getCountTitle(FileDto dto){
		//전체 row의 갯수를 담을 지역변수
		int count=0;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			/*
			 * ROWNUM중에서 가장 큰 수 select하면 전체 row의 갯수가 된다.
			 * 만약 row가 하나도 없으면 null을 리턴하기 때문에
			 * null인 경우 0으로 바꿔줘야한다. NVL(max(ROWNUM), 0)
			 */
			String sql = "select NVL(max(ROWNUM), 0) as num"
					+ " from board_file"
					+ "	where title like '%'|| ? || '%'";
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩
			pstmt.setString(1, dto.getTitle());

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection반납
			} catch (Exception e) {
			}
		}
		return count;
	}

	//제목 파일명 검색결과 row 갯수 리턴하는 메소드
	public int getCountWriter(FileDto dto){
		//전체 row의 갯수를 담을 지역변수
		int count=0;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			/*
			 * ROWNUM중에서 가장 큰 수 select하면 전체 row의 갯수가 된다.
			 * 만약 row가 하나도 없으면 null을 리턴하기 때문에
			 * null인 경우 0으로 바꿔줘야한다. NVL(max(ROWNUM), 0)
			 */
			String sql = "select NVL(max(ROWNUM), 0) as num"
					+ " from board_file"
					+ "	where writer like '%'|| ? || '%'";
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩
			pstmt.setString(1, dto.getWriter());

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection반납
			} catch (Exception e) {
			}
		}
		return count;
	}
	
	//파일 정보를 DB에 저장하는 메소드
	public boolean insert(FileDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			
			String sql = "insert into board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " values(board_file_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			//sql문 ?, 에 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
				
			//sql문 수행하고 update or insert or delete된 row의 갯수 리턴받기
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

	
	//파일목록을 리턴해주는 메소드
	public List<FileDto> getList(FileDto dto){ //startRowNum, endRowNum을 받아서 select
		
		List<FileDto> list=new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select *"
					+ " from"
					+ "		(select result.*, rownum as rnum"
					+ "		from (select num, writer, title, orgFileName, fileSize, regdate"
					+ "				from board_file"
					+ "				oreder by num desc) result1)"
					+ " where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				FileDto tmp = new FileDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setRegdate(rs.getString("regdate"));
				
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	//제목+파일명 검색
	public List<FileDto> getListTitleFileName(FileDto dto){
		
		List<FileDto> list=new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select *"
					+ " from"
					+ "		(select result.*, rownum as rnum"
					+ "		from (select num, writer, title, orgFileName, fileSize, regdate"
					+ "				from board_file"
					+ "				where title like '%'|| ? ||'%' or orgFileName like '%'|| ? ||'%'"
					+ "				oreder by num desc) result1)"
					+ " where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setInt(3, dto.getStartRowNum());
			pstmt.setInt(4, dto.getEndRowNum());
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				FileDto tmp = new FileDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setRegdate(rs.getString("regdate"));
				
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}

	//제목 검색 메소드
	public List<FileDto> getListTitle(FileDto dto){
			
		List<FileDto> list=new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select *"
					+ " from"
					+ "		(select result.*, rownum as rnum"
					+ "		from (select num, writer, title, orgFileName, fileSize, regdate"
					+ "				from board_file"
					+ "				where title like '%'|| ? ||'%'"
					+ "				oreder by num desc) result1)"
					+ " where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, dto.getTitle());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				FileDto tmp = new FileDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setRegdate(rs.getString("regdate"));
				
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
		}

	//작성자 검색
	public List<FileDto> getListWriter(FileDto dto){
		
		List<FileDto> list=new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select *"
					+ " from"
					+ "		(select result.*, rownum as rnum"
					+ "		from (select num, writer, title, orgFileName, fileSize, regdate"
					+ "				from board_file"
					+ "				where writer like '%'|| ? ||'%'"
					+ "				oreder by num desc) result1)"
					+ " where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, dto.getWriter());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				FileDto tmp = new FileDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setRegdate(rs.getString("regdate"));
				
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
		}
	
	
	//파일 번호에 해당하는 파일 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		
		FileDto dto = null;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			String sql = "select writer, title, orgFileName, saveFileName, filseSize, regdate"
					+ " from board_file"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩
			pstmt.setInt(1, num);

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			if (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("filseSize"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection반납
			} catch (Exception e) {
			}
		}		
		return dto;
	}

	//파일 삭제 메소드
	public boolean deleteFile(int num) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			String sql = "delete from board_file where num=?";

			pstmt = conn.prepareStatement(sql);

			//sql문 내의 ? 에 바인딩
			pstmt.setInt(1, num);

			//sql문 수행하고 수행 된 row의 갯수 리턴받기
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

}//FileDao

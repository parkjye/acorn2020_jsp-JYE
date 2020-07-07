package test.playlist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.playlist.dto.PlaylistDto;
import test.util.DbcpBean;

public class PlaylistDao {
	private static PlaylistDao dao;
	private PlaylistDao() {}
	
	public static PlaylistDao getInstance() {
		if(dao==null) {
			dao = new PlaylistDao();
		}
		return dao;
	}
	
	//[return] PlayList 전체
	public List<PlaylistDto> getList(){
		
		List<PlaylistDto> list = new ArrayList<>(); 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try { 
			conn = new DbcpBean().getConn();
			
			String sql = "select num, checked, title, singer, TO_CHAR(time, 'MI:SS') as time"
					+ " from playlist"
					+ " order by num asc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				PlaylistDto dto = new PlaylistDto();
				dto.setNum(rs.getInt("num"));
				dto.setChecked(rs.getString("checked"));
				dto.setTitle(rs.getString("title"));
				dto.setSinger(rs.getString("singer"));
				dto.setTime(rs.getString("time"));
				
				list.add(dto);
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
	}//getList()
	
	//[return] list 한 개
	public PlaylistDto getSingleList(int num) {
		PlaylistDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			
			String sql="select num, checked, title, singer, TO_CHAR(time, 'MI:SS') as time"
					+ " from playlist"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			//select된 결과가 있으면 Dto에
			if(rs.next()) {
				dto = new PlaylistDto();
				dto.setNum(num);
				dto.setChecked(rs.getString("checked"));
				dto.setTitle(rs.getString("title"));
				dto.setSinger(rs.getString("singer"));
				dto.setTime(rs.getString("time"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	//[return] list 삭제 (+check를 활용해서 다중 삭제)
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();

			String sql = "delete from playlist where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
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
	
	//[return] 노래 추가
	public boolean insert(PlaylistDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "insert into playlist"
					+ "(num, checked, title, singer, time)"
					+ "values(playlist_seq.nextval, 'false', ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getSinger());

			//sql문 수행하고 update or insert or delete된 row의 갯수 리턴받기
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
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
	
	//[return] 수정
	public boolean update(PlaylistDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "update playlist"
					+ " set title=?, singer=?"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getSinger());
			pstmt.setInt(3, dto.getNum());

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
 
	//[return] 음악 리스트 추가
	/*public boolean addALsit(PlaylistDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "insert into playlist"
					+ "(num, checked, title, singer, time)"
					+ "values(playlist_seq.nextval, 'false', ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getSinger());

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
	}*/
	
	
}//PlaylistDao

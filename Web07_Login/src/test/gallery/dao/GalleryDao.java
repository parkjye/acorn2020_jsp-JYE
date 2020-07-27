package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.gallery.dto.GalleryDto;
import test.util.DbcpBean;

public class GalleryDao {
	private static GalleryDao dao;
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao==null) {
			dao=new GalleryDao();
		}
		return dao;
	}
	
	//이미지 목록을 리턴하는 메소드
	public List<GalleryDto> getList(GalleryDto dto){
		
		List<GalleryDto> list = new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			String sql = "select * "
					+ "from"
					+ "		(select result1.*, ROWNUM as rnum"
					+ " 	from"
					+ " 		(select num, writer, caption, imagePath, regdate"
					+ " 		from board_gallery"
					+ " 		order by num desc) result1)"
					+ " where rnum between ? and ?";
			
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				GalleryDto tmp = new GalleryDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setCaption(rs.getString("caption"));
				tmp.setImagePath(rs.getString("imgePath"));
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
					conn.close(); //Connection반납
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	//이미지 정보를 DB에 저장하는 메소드
	public boolean insert(GalleryDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			String sql = "insert into board_gallery"
					+ " (num, writer, caption, imagePath, regdate)"
					+ " values(board_gallery_seq.nextval, ?, ?, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);

			//sql문 내의 ? 에 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getCaption());
			pstmt.setString(3, dto.getImagePath());

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
	
	//전체 row의 갯수를 리턴하는 메소드
	public int getCount() {
		
		int count=0;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			
			String sql = "select NVL(MAX(ROWNUM), 0) as count"
					+ " from board_gallery";
			pstmt = conn.prepareStatement(sql);
			
			//sql문 ?, 에 바인딩
			
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기 
			if(rs.next()) {
				count=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return count;
	}
	

}//GalleryDao
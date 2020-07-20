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
	public List<GalleryDto> getList(){
		List<GalleryDto> list = new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			//실행할 sql 문 준비하기
			String sql = "select num, writer, caption, imagePath, regdate"
					+ " from board_gallery"
					+ " order by num desc";
			
			pstmt = conn.prepareStatement(sql);

			//sql문 values내의 ?에 바인딩

			//select문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();

			//반복문 돌면서 결과 값 추출하기
			while (rs.next()) {
				GalleryDto dto = new GalleryDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setCaption(rs.getString("caption"));
				dto.setImagePath(rs.getString("imgePath"));
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
	
	
}//GalleryDao

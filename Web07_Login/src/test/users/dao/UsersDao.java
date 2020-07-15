package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {}
	
	public static UsersDao getInstance() {
		if(dao == null) {
			dao = new UsersDao();
		}
		return dao;
	}
	
	//회원 정보를 저장하는 메소드(profile 컬럼 제외)
	public boolean insert(UsersDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			
			String sql = "insert into users"
					+ " (id, pwd, email, regdate)"
					+ " values(?, ?, ?, sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			//sql문 ?, 에 바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());					
				
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
	
	//UsersDto 객체에 있는 id, pwd가 유효한 정보인지 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		//유효한 정보인지 여부를 담을 지역변수 만들고 초기값 false 부여하기
		boolean isValid = false;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			
			String sql = "select id"
					+ "	from users"
					+ " where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			
			//sql문 ?, 에 바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기 
			if(rs.next()) {
				//select된 결과가 있으면 유효한 정보이므로 isValid에 true를 넣어준다.
				isValid = true;
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
		//아이디 비밀번호가 유요한 정보인지 여부를 리턴한다.
		return isValid;
			}

	//회원 정보 리턴
	public UsersDto getData(String id) {
		
		UsersDto dto = null;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			
			String sql = "select pwd, email, profile, regdate"
					+ "	from users"
					+ "	where id=?";
			pstmt = conn.prepareStatement(sql);
			
			//sql문 ?, 에 바인딩
			pstmt.setString(1, id);
			
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기 
			if(rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));	
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
		return dto;
		}
	
	//회원 탈퇴
	public boolean deleteUser(String id) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			String sql = "delete from users where id=?";

			pstmt = conn.prepareStatement(sql);

			//sql문 ?, 에 바인딩
			pstmt.setString(1, id);

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
	
	//비밀번호 수정 반영
	public boolean updatePwd(UsersDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			String sql = "update users"
					+ " set pwd=?"
					+ " where id=? and pwd=?";

			pstmt = conn.prepareStatement(sql);

			//sql문 ?, 에 바인딩
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());

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
		
	//정보 수정
	public boolean update(UsersDto dto) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();

			String sql = "update users"
					+ " set email=?"
					+ " where id=?";

			pstmt = conn.prepareStatement(sql);

			//sql문 ?, 에 바인딩
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getId());

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
	
	//인자로 전달된 아이디가 users테이블에 존재하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId) {
		
		boolean isExist = false;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//Connection Pool에서 Connection 객체를 하나 가지고 온다.
			conn = new DbcpBean().getConn();
			
			String sql = "select id"
					+ " from users"
					+ " where id=?";
			pstmt = conn.prepareStatement(sql);
			
			//sql문 ?, 에 바인딩
			pstmt.setString(1, inputId);
			
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 결과 값 추출하기 
			if(rs.next()) {
				isExist=true; //해당 아이디가 이미 존재하는 경우				
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
		return isExist; //아이디 존재 여부를 리턴한다.
	}
	
	
}//UsersDao

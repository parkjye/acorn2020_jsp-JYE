package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	private TodoDao() {}
	
	public static TodoDao getInstance() {
		if(dao==null) {
			dao=new TodoDao();
		}
		return dao;
	}
	
	//할 일 목록을 읽어오는 메소드
	public List<TodoDto> getList(){
		List<TodoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=new DbcpBean().getConn();
			
			//실행할 sql문 준비하기
			String sql="select num,content, TO_CHAR(regdate, 'YY\"년\"MM\"월\"DD\"일\"HH24\"시\"MI\"분\"') as regdate"
					+" from todo"
					+" order by num asc";
			pstmt = conn.prepareStatement(sql);
			
			//sql문에 ? 에 바인딩할 값이 있으면 바인딩하고
			
			//select문 수행하고 결과 받아오기
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				//row하나의 정보를 Dto객체에 담고
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				//Dto의 참조값을 ArrayList객체에 누적시킨다.
				list.add(dto);
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
		return list;
	}

	//할 일 추가 메소드
	public boolean insert(String content) {
	
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "insert into todo"
					+" (num, content, regdate)"
					+" values(todo_seq.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, content);

			//sql문 수행하고 update or insert or delete된 row의 갯수 리턴받기
			flag=pstmt.executeUpdate();
			
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
		if(flag>0) {
			return true;
		}else {
			return false;
		}	
	}//insert()
	
	//삭제 메소드
	public boolean delete(int num) {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "delete from todo where num=?";
			pstmt = conn.prepareStatement(sql);
			
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, num);
			
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
	}//delete()
	
	
}//TodoDao


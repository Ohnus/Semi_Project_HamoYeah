package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class CommentDao {
	private DBConnect dbconn;
	
	public CommentDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(CommentVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into h_comment values(?, ?, seq_comment.nextval, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, vo.getMemberId());
			pstmt.setInt(2, vo.getBoardNum());
			pstmt.setInt(3, vo.getReRepNum());
			pstmt.setString(4, vo.getContent());
			
			int num = pstmt.executeUpdate();
			System.out.println(num+"줄 추가됨");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void delete(String memberId) {
		Connection conn = dbconn.conn();

		String sql = "delete from h_comment where member_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄 삭제");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

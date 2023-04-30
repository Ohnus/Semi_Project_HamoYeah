package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class CommentDao {
	private DBConnect dbconn;
	
	public CommentDao() {
		dbconn = DBConnect.getInstance();
	}
	
	//댓글 추가
	public void insert(CommentVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into h_comment values(?, ?, seq_h_comment.nextval, ?, ?)";
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
	
	//댓글번호로 검색
	public CommentVo select(int repNum) {
		Connection conn = dbconn.conn();
		String sql = "select * from h_comment where rep_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return new CommentVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	//1차 댓글 검색
	public ArrayList<CommentVo> selectByboardNum(int boardNum){
		ArrayList<CommentVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from h_comment where board_num=? and re_rep_num=0 order by rep_num";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new CommentVo(rs.getString(1),rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));				
			}			
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
		return list;
		
	}
	//대댓글 검색
	public ArrayList<CommentVo> selectByrepNum(int repNum){
		ArrayList<CommentVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from h_comment where rep_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new CommentVo(rs.getString(1),rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));				
			}			
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
		return list;
		
	}
	public void delete(int repNum) { //->memberid -> repNum
		Connection conn = dbconn.conn();
		System.out.println("dao"+repNum);
		String sql = "delete from h_comment where rep_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNum);
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

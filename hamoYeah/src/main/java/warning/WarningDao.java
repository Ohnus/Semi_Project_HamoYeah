package warning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class WarningDao {
	private DBConnect dbconn;
	
	public WarningDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(WarningVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into h_warning values(?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getMemberId());
			pstmt.setInt(2, vo.getBoardNum());
			pstmt.setString(3, vo.getContent());
			
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
	
	public ArrayList<WarningVo> select(int boardNum) {
		Connection conn = dbconn.conn();
		ArrayList<WarningVo> list = new ArrayList<>();
		String sql = "select * from h_warning where board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new WarningVo(rs.getString(1), rs.getInt(2), rs.getString(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public WarningVo selectByIdNum(String memberId, int boardNum) {
		Connection conn = dbconn.conn();
		String sql = "select * from h_warning where member_id=? and board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, boardNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return new WarningVo(rs.getString(1), rs.getInt(2), rs.getString(3));
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
		return null;
	}
}

package warning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}

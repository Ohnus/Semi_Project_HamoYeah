package likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVo;
import conn.DBConnect;

public class LikesDao {
	private DBConnect dbconn;
	
	public LikesDao () {
		dbconn = DBConnect.getInstance();
	}
	
	
	
	// 좋아요 추가
		public void insert(LikesVo vo) {
			Connection conn = dbconn.conn();
			
			String sql = "insert into h_likes values(?, ?,h_likes_seq.nextval)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, vo.getMember_id());
				pstmt.setInt(2, vo.getReview_num());
				
				int num = pstmt.executeUpdate();
				System.out.println(num + "줄이 추가되었습니다.");
				
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
		
		
		// '좋아요' 삭제
		public void delete(int review_num) {
			Connection conn = dbconn.conn();
			
			String sql = "delete h_likes wehre review_num=?";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, review_num);
				
				int num2 = pstmt.executeUpdate();
				System.out.println(num2 + "줄이 삭제되었습니다.");
				
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

		// 'review_num'으로 검색했을 때 나오는 데이터의 줄 수를 셈
		// 멤버ID로 검색
		public ArrayList<LikesVo> selectReviewNum(int review_num) {
			Connection conn = dbconn.conn();
			ArrayList<LikesVo> list = new ArrayList();
			
			String sql = "select * from h_review where review_num=?";
				
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, review_num);
			
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					list.add(new LikesVo(rs.getString(1), rs.getInt(2), rs.getInt(3)));
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


}

package favorites;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVo;
import conn.DBConnect;
import participate.ParticipateVo;

public class FavoritesDao {
	private DBConnect dbconn;

	public FavoritesDao() {
		dbconn = DBConnect.getInstance();
	}

	// insert -- 별표 누르면 추가됨
	public void insert(FavoritesVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into H_favorites values(?, ?, 0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setInt(2, vo.getBoardNum());

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

	// 즐겨찾기 노란별버튼을 누르면 1로 변함
	public void updateDel1(FavoritesVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update H_favorites set del_cnt = 1 where member_id = ? and board_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setInt(2, vo.getBoardNum());
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 수정되었습니다.");
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

	// 즐겨찾기 회색별버튼을 누르면 0로 변함
	public void updateDel2(FavoritesVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update H_favorites set del_cnt = 0 where member_id = ? and board_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setInt(2, vo.getBoardNum());
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 수정되었습니다.");
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

	// delete -- 회색별로 둔 게시글만
	public void deleteCnt1(String memberId) {
		Connection conn = dbconn.conn();
		String sql = "delete from H_favorites where member_id = ? and del_cnt = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);

			int number = pstmt.executeUpdate();
			System.out.println(number + "줄이 삭제되었습니다.");

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
	
	// delete -- 진행완료된 게시글이면 삭제 
		public void delete(int boardNum) {
			Connection conn = dbconn.conn();
			String sql = "delete from H_favorites where board_num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNum);

				int number = pstmt.executeUpdate();
				System.out.println(number + "줄이 삭제되었습니다.");

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

	// id로 select
	public ArrayList<FavoritesVo> selectList(String memberId) {
		ArrayList<FavoritesVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from H_favorites where member_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);

			ResultSet rs = pstmt.executeQuery(); // select 실행
			while (rs.next()) { // 첫 줄로 이동하여 데이터 있는지 확인
				list.add(new FavoritesVo(rs.getString(1), rs.getInt(2), rs.getInt(3)));
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
	
	// boardNum과 memberId로 셀렉.
	public FavoritesVo selectVo(int boardNum, String memberId) {
		Connection conn = dbconn.conn();

		String sql = "select * from H_favorites where board_num = ? and member_id = ?";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, memberId);
		
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return new FavoritesVo(rs.getString(1), rs.getInt(2), rs.getInt(3));
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

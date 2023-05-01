package participate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import favorites.FavoritesVo;

public class ParticipateDao {
	private DBConnect dbconn;

	public ParticipateDao() {
		dbconn = DBConnect.getInstance();
	}

	// insert (참여하기 버튼 누름)
	public void insert(ParticipateVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into H_participate values(?, ?, 0)";
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

	// delete -- 신청취소 누르면 삭제~
	public void delete(int boardNum, String memberId) {
		Connection conn = dbconn.conn();
		String sql = "delete from H_participate where board_num=? and member_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, memberId);

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

	// update (승인)
	public void updateOk1(ParticipateVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update H_participate set ok = 1 where member_id = ? and board_num = ?";
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

	// update (거절) .. 승인한 사람 수가 peopleMax에 도달하면 이외의 사람들은 자동으로 거절됨.
	public void updateOk2(ParticipateVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update H_participate set ok = 2 where member_id = ? and board_num = ?";
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

	// select (미승인)
	public ArrayList<String> selectOk0(int boardNum) {
		ArrayList<String> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select member_id from H_participate where ok = 0 and board_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);

			ResultSet rs = pstmt.executeQuery(); // select 실행
			while (rs.next()) { // 첫 줄로 이동하여 데이터 있는지 확인
				list.add(rs.getString(1));
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

	// select (승인)
	public ArrayList<String> selectOk1(int boardNum) {
		ArrayList<String> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select member_id from H_participate where ok = 1 and board_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);

			ResultSet rs = pstmt.executeQuery(); // select 실행
			while (rs.next()) { // 첫 줄로 이동하여 데이터 있는지 확인
				list.add(rs.getString(1));
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

	// select memberId -- 참여한 모임에 띄울 거.
	public ArrayList<ParticipateVo> selectPvo(String memberId) {
		ArrayList<ParticipateVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from H_participate where member_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);

			ResultSet rs = pstmt.executeQuery(); // select 실행
			while (rs.next()) { // 첫 줄로 이동하여 데이터 있는지 확인
				list.add(new ParticipateVo(rs.getString(1), rs.getInt(2), rs.getInt(3)));
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

	// 참여 신청했는지 알기 위해 검색~
	public ParticipateVo selectOne(int boardNum, String memberId) {
		Connection conn = dbconn.conn();

		String sql = "select * from H_participate where board_num = ? and member_id = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, memberId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return new ParticipateVo(rs.getString(1), rs.getInt(2), rs.getInt(3));
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

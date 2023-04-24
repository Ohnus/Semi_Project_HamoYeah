package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class HMemberDao {
	DBConnect dbconn;

	public HMemberDao() {
		dbconn = DBConnect.getInstance();
	}

	// 회원 추가
	public void insert(HMemberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into H_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getNickname());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getAge());
			pstmt.setString(8, vo.getIntro());
			pstmt.setString(9, vo.getTag1());
			pstmt.setString(10, vo.getTag2());
			pstmt.setString(11, vo.getTag3());
			pstmt.setString(12, vo.getImagepath());
			int num = pstmt.executeUpdate();
			System.out.println(num + "명의 회원이 추가되었습니다.");
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

	// 회원ID로 검색
	public HMemberVo selectById(String memberId) {
		HMemberVo vo = null;
		Connection conn = dbconn.conn();
		String sql = "select * from h_member where member_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new HMemberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
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
		return vo;
	}

	// 핸드폰번호로 검색
	public HMemberVo selectByPhone(String phone) {
		HMemberVo vo = null;
		Connection conn = dbconn.conn();
		String sql = "select * from h_member where phone=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new HMemberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
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
		return vo;
	}
	
	// 핸드폰번호로 검색
	public HMemberVo selectByNickname(String nickname) {
		HMemberVo vo = null;
		Connection conn = dbconn.conn();
		String sql = "select * from h_member where nickname=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new HMemberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
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
		return vo;
	}

	// 회원ID로 전체
	public ArrayList<HMemberVo> selectAll() {
		ArrayList<HMemberVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from H_member";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new HMemberVo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10), rs.getString(11), rs.getString(12)));
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

	// 회원 정보 수정
	public void update(HMemberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update H_member set pwd=?, phone=?, age=?, nickname=?, tag1=?, tag2=?, tag3=?, intro=?, imagepath=? where member_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAge());
			pstmt.setString(4, vo.getNickname());
			pstmt.setString(5, vo.getTag1());
			pstmt.setString(6, vo.getTag2());
			pstmt.setString(7, vo.getTag3());
			pstmt.setString(8, vo.getIntro());
			pstmt.setString(9, vo.getImagepath());
			pstmt.setString(10, vo.getMemberId());
			int num = pstmt.executeUpdate();
			System.out.println(num + "명의 정보가 수정되었습니다.");
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

	// 회원 삭제
	public void delete(String memberId) {
		Connection conn = dbconn.conn();
		String sql = "delete from H_member where member_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			int num = pstmt.executeUpdate();
			System.out.println(num + "명의이 회원이 탈퇴되었습니다.");
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

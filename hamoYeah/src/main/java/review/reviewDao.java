package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVo;
import conn.DBConnect;

public class reviewDao {
	private DBConnect dbconn;

	public reviewDao() {
		dbconn = DBConnect.getInstance();
	}
	
	//리뷰작성(add)
	public void insert(reviewVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into H_review values(?,seq_H_review.nextval, ?, sysdate,0,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getmemberId());
			pstmt.setInt(2, vo.getboardNum());
			pstmt.setString(3, vo.getImagepath());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getTag());
			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 추가되었다");
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
	
//후기수정(edit)	primary key(review_num)로 내용(content) 수정
	public void update(reviewVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update H_review set content=?, imagepath=? where review_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getImagepath());
			pstmt.setInt(3, vo.getreviewNum());
			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 수정됨");
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

	public reviewVo selectIdNum(String memberId, int BoardNum) {
		Connection conn = dbconn.conn();
		String sql = "select * from h_review where member_id=? and board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, BoardNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return new reviewVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));
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
	
	//selectAll(review 전체목록 띄우기)
	public ArrayList<reviewVo> selectAll(){
		Connection conn = dbconn.conn();
		ArrayList<reviewVo> list = new ArrayList<>();
		String sql = "select * from H_review order by review_num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new reviewVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
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
	
	//selectByTag(Tag로 검색)	>>> arraylist로 반환
	public ArrayList<reviewVo> selectByTag(String tag) {
		Connection conn = dbconn.conn();
		ArrayList<reviewVo> list = new ArrayList<>();
		String sql = "select * from h_review where tag=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tag);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new reviewVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
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

	
	//selectByMember(작성자로 검색)
	public ArrayList<reviewVo> selectByMemberId(String memberId){
		Connection conn = dbconn.conn();
		ArrayList<reviewVo> list = new ArrayList<>();
		String sql = "select * from H_review where member_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new reviewVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
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
	
	//selectByReviewNum(ReviewNum로 검색)
	public reviewVo selectByReviewNum(int reviewNum) {
		Connection conn = dbconn.conn();
		String sql = "select * from H_review where review_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return new reviewVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));
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
		
	//selectByBoardNum(BoardNum로 검색)
		public ArrayList<reviewVo> selectByBoardNum(int BoardNum) {
			Connection conn = dbconn.conn();
			ArrayList<reviewVo> list = new ArrayList<>();
			String sql = "select * from h_review where Board_num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, BoardNum);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(new reviewVo(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
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
	
		
		public void delete(int reviewNum) {
			Connection conn = dbconn.conn();
			String sql = "delete from h_review where review_num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reviewNum);
				int num = pstmt.executeUpdate();
				System.out.println(num + " 줄이 삭제됨");
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




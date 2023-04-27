package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class BoardDao {
	private DBConnect dbconn;
	
	public BoardDao () {
		dbconn = DBConnect.getInstance();
	}
	
	
	// 글 추가
	public void insert(BoardVo vo) {
		Connection conn = dbconn.conn();
		
		String sql = "insert into H_board values(?, seq_H_board.nextval, sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getImagepath());
			pstmt.setString(5, vo.getPlace());
			pstmt.setString(6, vo.getdDay());
			pstmt.setString(7, vo.getTag());
			pstmt.setInt(8, vo.getPeopleMax());
			pstmt.setInt(9, vo.getY_card());
			pstmt.setInt(10, vo.getProcess());
			pstmt.setInt(11, vo.getOk());

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

	
	// 글 수정
	public void update(BoardVo vo) {
		Connection conn = dbconn.conn();
		
		String sql = "update H_board set title=?, content=?, imagepath=? where board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getImagepath());
			pstmt.setInt(4, vo.getBoardNum());
			
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
	
	
	// 글 삭제
	public void delete(int board_num) {
		Connection conn = dbconn.conn();
		
		String sql = "delete H_board where board_num=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board_num);
			
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
	
	
	// 전체 리스트 검색
	public ArrayList<BoardVo> selectAll() {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	// 글 번호로 검색 	
	public BoardVo selectBoardNum(int board_num) {
		Connection conn = dbconn.conn();

		String sql = "select * from H_board where board_num=?";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board_num);
		
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13));
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
	

	
	// 멤버ID로 검색
	public ArrayList<BoardVo> selectId(String memberId) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where member_id=? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
			
	
	// tag로 검색
	public ArrayList<BoardVo> selectTag(String tag) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where tag=? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tag);
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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

	
	// 장소 키워드로 검색
	public ArrayList<BoardVo> selectPlace(String place) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where place like ? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + place + "%");
	
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	
	// 제목 키워드로 검색
	public ArrayList<BoardVo> selectTitle(String title) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where title like ? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + title + "%");
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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

	
	// 내용 키워드로 검색
	public ArrayList<BoardVo> selectContent(String content) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where content like ? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" +content+ "%");
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	
	// 장소 키워드 + 태그로 검색
	public ArrayList<BoardVo> selectPlaceAndTag(String place, String tag) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where place like ? and tag=? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			
			pstmt.setString(1, "%" + place + "%");
			pstmt.setString(2, "%" + tag + "%");
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	
	// 제목 키워드 + 태그로 검색
	public ArrayList<BoardVo> selectTitleAndTag(String title, String tag) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where title like ? and tag=? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + title+ "%");
			pstmt.setString(2, "%" + tag + "%");
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	// 내용 키워드 + 태그로 검색
	public ArrayList<BoardVo> selectContentAndTag(String content, String tag) {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from H_board where content like ? and tag=? order by board_num desc";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + content + "%");
			pstmt.setString(2, "%" + tag + "%");
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	
	// 모임 완료된 글 검색
	public ArrayList<BoardVo> selectComplete() {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from h_board where D_DAY < to_char(SYSDATE, 'YYYY-MM-DD')";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	
	// 모임 진행중인 글 검색
	public ArrayList<BoardVo> selectOngoing() {
		Connection conn = dbconn.conn();
		ArrayList<BoardVo> list = new ArrayList();
		
		String sql = "select * from h_board where D_DAY > to_char(SYSDATE, 'YYYY-MM-DD')";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13)));
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
	
	// 참여 인원 업데이트
	public void updateParticipate(BoardVo vo) {
		Connection conn = dbconn.conn();
		
		String sql = "update H_board set ok=? where board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getOk());
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
	
	// 신고된 글 복구
	public void updateProcessRe(int boardnum) {
		Connection conn = dbconn.conn();
		String sql = "update H_board set process=1, y_card=0 where board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardnum);
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
	
	// 신고된 글 삭제
	public void updateProcessStop(int boardnum) {
		Connection conn = dbconn.conn();
		String sql = "update H_board set process=2 where board_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardnum);
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
	
}



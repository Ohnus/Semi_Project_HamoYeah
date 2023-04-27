package favorites;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class FavoritesService {
	private FavoritesDao dao;

	public FavoritesService() {
		dao = new FavoritesDao();
	}

	// insert -- 별표 누르면 추가됨
	public void insert(FavoritesVo vo) {
		dao.insert(vo);
	}

	// 즐겨찾기 노란별버튼을 누르면 1로 변함
	public void editDel0to1(FavoritesVo vo) {
		dao.updateDel1(vo);
	}

	// 즐겨찾기 회색별버튼을 누르면 0로 변함
	public void editDel1to0(FavoritesVo vo) {
		dao.updateDel2(vo);
	}

	// delete -- 회색별로 둔 게시글만
	public void deleteCnt1(String memberId) {
		dao.deleteCnt1(memberId);
	}

	// delete -- 진행완료된 게시글이면 삭제
	public void deleteEnd(int boardNum) {
		dao.delete(boardNum);
	}

	// id로 select
	public ArrayList<FavoritesVo> getFavList(String memberId) {
		return dao.selectList(memberId);
	}
	
	// id와 boardNum으로 select 
	public FavoritesVo getFavVo(int boardNum, String memberId) {
		return dao.selectVo(boardNum, memberId);
	}
}

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
	public void editDel1(FavoritesVo vo) {
		dao.updateDel1(vo);
	}

	// 즐겨찾기 회색별버튼을 누르면 0로 변함
	public void editDel2(FavoritesVo vo) {
		dao.updateDel2(vo);
	}

	// delCnt가 1인거 다 delete
	public void delete(String memberId, int boardNum) {
		dao.delete(memberId, boardNum);
	}

	// id로 select
	public ArrayList<FavoritesVo> getBoard(String memberId) {
		return dao.selectBoard(memberId);
	}

}

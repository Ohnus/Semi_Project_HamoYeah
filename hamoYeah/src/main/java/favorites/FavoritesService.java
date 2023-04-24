package favorites;

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
	
	// delete
	public void delete(String memberId, int boardNum){
		dao.delete(memberId, boardNum);
	}
	// id로 select
	public ArrayList<FavoritesVo> getBoard(String memberId) {
		return dao.selectBoard(memberId);
	}

}

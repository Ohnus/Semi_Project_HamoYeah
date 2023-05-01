package warning;

import java.util.ArrayList;

public class WarningService {
private WarningDao dao;
	
	public WarningService() {
		dao = new WarningDao();
	}
	
	public void addWarning(WarningVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<WarningVo> selectByNum(int boardNum) {
		return dao.select(boardNum);
	}
	
	public WarningVo getByIdNum(String memberId, int boardNum) {
		return dao.selectByIdNum(memberId, boardNum);
	}
}

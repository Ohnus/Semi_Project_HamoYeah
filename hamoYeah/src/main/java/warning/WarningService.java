package warning;


public class WarningService {
private WarningDao dao;
	
	public WarningService() {
		dao = new WarningDao();
	}
	
	public void join(WarningVo vo) {
		dao.insert(vo);
	}
}

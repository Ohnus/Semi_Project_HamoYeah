package comment;

public class CommentService {
	private CommentDao dao;
	
	public CommentService() {
		dao = new CommentDao();
	}
	
	public void join(CommentVo vo) {
		dao.insert(vo);
	}
	
	public void delComment(String memberId) {
		dao.delete(memberId);
	}
}

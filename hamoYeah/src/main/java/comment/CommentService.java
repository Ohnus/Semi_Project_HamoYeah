package comment;

import java.util.ArrayList;

public class CommentService {
	private CommentDao dao;
	
	public CommentService() {
		dao = new CommentDao();
	}
	
	public void addComment(CommentVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<CommentVo> getByboardNum(int boardNum) { //댓글
		return dao.selectByboardNum(boardNum);
	}
	
	public ArrayList<CommentVo> getByrepNum(int repNum) { //대댓글(답글)
		return dao.selectByrepNum(repNum);
	}
	
	public void delComment(String memberId) {
		dao.delete(memberId);
	}
}

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
	
	public void selecAll(int boardNum) { //추가
		dao.selectByboardNum(boardNum);
	}
	
	public CommentVo selectByNum(int repNum) {
		return dao.select(repNum);
	}
	
	public ArrayList<CommentVo> getByboardNum(int boardNum) { //댓글
		return dao.selectByboardNum(boardNum);
	}
	
	public ArrayList<CommentVo> getByrepNum(int repNum) { //대댓글(답글)->안쓸꺼임
		return dao.selectByrepNum(repNum);
	}
	
	public void delComment(int repNum) {//memberId -> repNum 수정
		dao.delete(repNum);
	}
}

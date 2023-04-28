package review;

import java.util.ArrayList;

public class reviewService {
	private reviewDao dao;
	public final static String path = "C:\\Users\\Heesoo KIM\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
	
	public reviewService() {
		dao = new reviewDao();
	}
	
	//리뷰작성(add)
	public void addReview(reviewVo vo) {
		dao.insert(vo);
	}
	
	//후기수정(edit):	primary key(review_num)로 내용(content) 수정
	public void editReview(reviewVo vo) {
		dao.update(vo);
	}

	//리뷰삭제(delete): primary key(review_num)로 찾아서 삭제
	public void delReview(int reviewNum) {
		dao.delete(reviewNum);
	}
	
	//selectAll(review 전체목록 띄우기)
	public ArrayList<reviewVo> getAll(){
		return dao.selectAll();
	}

	
	//selectByTag(Tag로 검색)
	public ArrayList<reviewVo> getByTag(String tag) {
		return dao.selectByMemberId(tag);
	}

	
	//selectByMember(작성자로 검색)
	public ArrayList<reviewVo> getByMemberId(String memberId){
		return dao.selectByMemberId(memberId);
	}
	
	
	public reviewVo getByReviewNum(int reviewNum) {
		return dao.selectByReviewNum(reviewNum);
	}
}


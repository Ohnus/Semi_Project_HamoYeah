package likes;

import java.util.ArrayList;

public class LikesService {
	private LikesDao dao;

	public LikesService() {
		dao = new LikesDao();
	}
		
		
		// 좋아요 추가
		public void insert(LikesVo vo) {
				dao.insert(vo);
		}
	
	
		// '좋아요' 삭제
		public void delete(int review_num) {
			dao.delete(review_num);
		}

		// 'review_num'으로 검색했을 때 나오는 데이터의 줄 수를 셈
		public ArrayList<LikesVo> getByReviewNum(int review_num) {
			return dao.selectReviewNum(review_num);
		}
	}

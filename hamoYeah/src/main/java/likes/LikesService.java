package likes;

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
      public void delete(LikesVo vo) {
         dao.delete(vo);
      }
      
      //리뷰 글번호를 받아서 그 리뷰의 행 수를 세어 좋아요 수를 반환
      public int getLikes(int review_num) {
         return dao.selectLike(review_num);
      }
      // 'review_num'과 id로 검색했을 때 나오는 데이터를 검사하여 검색된게 없으면 좋아요 테이블에 행을 추가, 있으면 행을 삭제
      public LikesVo getByReviewNum(int review_num, String id) {
         return dao.selectByNum(review_num, id);
      }
      
   }
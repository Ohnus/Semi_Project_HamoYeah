package likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import conn.DBConnect;

public class LikesDao {
   private DBConnect dbconn;
   
   public LikesDao () {
      dbconn = DBConnect.getInstance();
   }
   
   
   
   // 좋아요 추가
      public void insert(LikesVo vo) {
         Connection conn = dbconn.conn();
         
         String sql = "insert into h_likes values(?, ?,h_likes_seq.nextval)";
         
         try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, vo.getMember_id());
            pstmt.setInt(2, vo.getReview_num());
            
            int num = pstmt.executeUpdate();
            System.out.println(num + "줄이 추가되었습니다.");
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } finally {
            try {
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
      }
      
      
      // '좋아요' 삭제
      public void delete(LikesVo vo) {
         Connection conn = dbconn.conn();
         
         String sql = "delete h_likes where review_num=? and member_id=?";
         
         try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, vo.getReview_num());
            pstmt.setString(2, vo.getMember_id());
            
            int num2 = pstmt.executeUpdate();
            System.out.println(num2 + "줄이 삭제되었습니다.");
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } finally {
            try {
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
      }

      // 'review_num'으로 검색했을 때 나오는 데이터의 줄 수를 셈
      // 멤버ID로 검색
      public int selectLike(int review_num) {
            int num = 0;
            Connection conn = dbconn.conn();
            String sql = "select count(*) from h_likes where review_num=?";
            try {
               PreparedStatement pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, review_num);
               ResultSet rs = pstmt.executeQuery();
               if(rs.next()) {
                  num=rs.getInt(1);
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            return num;
         }


      public LikesVo selectByNum(int review_num, String id) {
         Connection conn = dbconn.conn();
         LikesVo vo = null;
         
         String sql = "select * from h_likes where review_num=? and member_id=?";
            
         try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, review_num);
            pstmt.setString(2, id);
         
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
               vo = new LikesVo(rs.getString(1),rs.getInt(2),rs.getInt(3));
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } finally {
            try {
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }   
         return vo;
      }
      
      
}
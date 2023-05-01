package handler.likes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import likes.LikesService;
import likes.LikesVo;

public class LikesHandler implements Handler {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      LikesService service = new LikesService();
         String id = request.getParameter("writer");
         int num = Integer.parseInt(request.getParameter("reviewNum"));
         LikesVo vo = service.getByReviewNum(num, id);
         //정보가 없으면 uplike
         if(vo==null) {
            service.insert(new LikesVo(id,num,0));
         //정보가 있으면 downlike
         }else {
            service.delete(new LikesVo(id,num,0));
         }
         
         
         int likecnt = service.getLikes(num);
         
         JSONObject obj = new JSONObject();
         obj.put("cnt", likecnt);
         String txt = obj.toJSONString();
         return "responsebody/"+txt;
   }

}
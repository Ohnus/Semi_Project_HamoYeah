package handler.review;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		String path = "C:\\Users\\Heesoo KIM\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
		int num = Integer.parseInt(request.getParameter("num"));
		reviewService s = new reviewService();
//		reviewVo vo = s.getReview_num(num);
//		String delf = path+vo.getPath();
//		File f =new File(delf);
//		f.delete();
		s.delReview(num);
		
		
		return "/review/list.jsp";
	}
}

package handler.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	
		
		reviewService service = new reviewService();
				
		ArrayList<reviewVo> list = service.getAll();
		request.setAttribute("list", list);
		request.setAttribute("view", "/review/list.jsp");
		return "/review/detail.jsp";
		
	}
}

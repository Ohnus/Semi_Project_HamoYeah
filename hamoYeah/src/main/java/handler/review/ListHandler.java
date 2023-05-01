package handler.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import likes.LikesService;
import review.reviewService;
import review.reviewVo;

public class ListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		System.out.println("왔다");
		reviewService service = new reviewService();
	
		
		ArrayList<reviewVo> list = new ArrayList<>();
		
		
		list = service.getAll();
		
		request.setAttribute("list", list);
		
		
		request.setAttribute("view", "/review/list.jsp");
		return "/main.jsp";
	}
}

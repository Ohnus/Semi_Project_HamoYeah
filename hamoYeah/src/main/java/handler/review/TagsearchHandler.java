package handler.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class TagsearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String tag = request.getParameter("id");
		System.out.println(tag);
		reviewService service = new reviewService();
		ArrayList<reviewVo> list = service.getByTag(tag);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		request.setAttribute("list", list);
		
		request.setAttribute("view", "/review/list.jsp");
		
		return "/main.jsp";
	}
}

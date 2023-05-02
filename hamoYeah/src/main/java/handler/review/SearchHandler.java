package handler.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class SearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		System.out.println(boardNum);
		reviewService service = new reviewService();
		ArrayList<reviewVo> list = service.getByBoardNum(boardNum);
		
		request.setAttribute("list", list);
		request.setAttribute("view", "/review/list.jsp");
		
		return "/main.jsp";
	}
}

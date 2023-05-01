package handler.review;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import review.reviewService;

public class DelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		System.out.println("왔냐");
		
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		reviewService service = new reviewService();
		service.delReview(reviewNum);
		
		return "/review/list.do";
	}
}


package handler.review;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String tag = request.getParameter("tag");
	
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		reviewService service = new reviewService();
				
		reviewVo vo = service.getByReviewNum(reviewNum);
		request.setAttribute("vo", vo);
		request.setAttribute("tag", tag);
		request.setAttribute("view", "/review/list.jsp");
		return "/main.jsp";
		
	}
}

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
		ArrayList<reviewVo> list = new ArrayList<>();
		reviewService service = new reviewService();
		
		
//		list = service.getByTag(String tag);
		request.setAttribute("list", list);
		return null;
	}

}

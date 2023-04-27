package handler.review;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class EditHandler implements Handler {

	String view = "";
	BoardService bservice = new BoardService();
	reviewService rservice = new reviewService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		if (request.getMethod().equals("GET")) {
			response.setCharacterEncoding("euc-kr");
			response.setContentType("text/html; charset=EUC-KR");

			
			int num = Integer.parseInt(request.getParameter("num"));
			
			
			//수정할 글내용, 이미지, 태그를 불러옴
			reviewVo vo = rservice.getByReviewNum(num);
			String content = request.getParameter("content");
			String tag = request.getParameter("imagepath");
			
			
			reviewService service = new reviewService();
			request.setAttribute("vo", vo);
			
			return "/review/detail.jsp";
			

		} else {
			try {
				request.setCharacterEncoding("euc-kr");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setCharacterEncoding("euc-kr");
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			String member_id = request.getParameter("writer");
			String imagepath = request.getParameter("imagepath");
			String content = request.getParameter("content");
			String tag = request.getParameter("tag");
			
			reviewService service = new reviewService();
			service.editReview(new reviewVo(null, 0, 0, null,0, imagepath,content, tag));


		}
		return "/review/list";
	}
}

package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import comment.CommentService;
import comment.CommentVo;
import handler.Handler;

public class DelCommHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int repNum = Integer.parseInt(request.getParameter("repNum"));
		System.out.println("handler:"+repNum);
		CommentService service = new CommentService();
		service.delComment(repNum);
		return null;
	}
}

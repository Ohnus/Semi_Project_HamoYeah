package handler.board;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class ContentSearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		String content = request.getParameter("searchText");
		
		BoardService service = new BoardService();
		ArrayList<BoardVo> list = service.getByContent(content);
		
		request.setAttribute("list", list);
		request.setAttribute("view", "/board/boardKeywordList.jsp");
		
		return "/main.jsp";
	}

}

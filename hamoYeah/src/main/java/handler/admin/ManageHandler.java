package handler.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class ManageHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String view = "";
		
		if (request.getMethod().equals("GET")) {
			BoardService service = new BoardService();
			ArrayList<BoardVo> list = service.getAllBoard();
			request.setAttribute("list", list);
			view = "/admin/adminPage.jsp";
		} else {

		}
		return view;
	}

}

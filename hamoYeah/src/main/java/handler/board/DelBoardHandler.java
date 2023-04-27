package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import handler.Handler;

public class DelBoardHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		BoardService service = new BoardService();
		service.delBoard(boardNum);

		return "/board/boardList.jsp";
	}

}

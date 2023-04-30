package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import handler.Handler;
import warning.WarningService;
import warning.WarningVo;

public class WarningHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		String memberId = request.getParameter("memberId");
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String content = request.getParameter("content");
		System.out.println(content);
		WarningService service = new WarningService();
		BoardService bservice = new BoardService();
		bservice.plusYcard(boardNum);
		service.addWarning(new WarningVo(memberId, boardNum, content));
		view = "redirect:/board/boardDetail.do?boardNum=" + boardNum + "&memberId=" + memberId;
		return view;
	}
}

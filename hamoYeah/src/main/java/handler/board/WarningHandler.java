package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		WarningService service = new WarningService();
		service.addWarning(new WarningVo(memberId, boardNum, content));
		view = "/board/boardDetail.do?boardNum=" + boardNum;
		return view;
	}
}

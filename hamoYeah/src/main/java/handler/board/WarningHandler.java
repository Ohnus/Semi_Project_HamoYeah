package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import warning.WarningService;

public class WarningHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if(request.getMethod().equals("GET")) {
			view="/board/warningList.jsp";
		}else {
			String memberId = request.getParameter("memberId");
			String boardNum = request.getParameter("boardNum");
			String content = request.getParameter("content");
			
			WarningService service = new WarningService();
			//service.join(new WarningVo(memberId, boardNum, content));
			
			view = "redirect:/boardList.jsp";
		}
		return view;
	}

}

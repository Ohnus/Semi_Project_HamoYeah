package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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
		WarningVo vo = service.getByIdNum(memberId, boardNum);
		boolean flag = (vo==null);
		if(flag) {
			BoardService bservice = new BoardService();
			bservice.plusYcard(boardNum);
			service.addWarning(new WarningVo(memberId, boardNum, content));
		} else {
			System.out.println("이미 신고한 게시글");
		}
		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		String txt = obj.toJSONString();
		
		view = "responsebody/" + txt;
		return view;
	}
}

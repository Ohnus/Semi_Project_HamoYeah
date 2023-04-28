package handler.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import warning.WarningService;
import warning.WarningVo;

public class ProcessHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		if (request.getMethod().equals("GET")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			BoardService bservice = new BoardService();
			BoardVo bvo = bservice.getByBoardNum(boardNum);
			WarningService wservice = new WarningService();
			ArrayList<WarningVo> list = wservice.selectByNum(boardNum);
			request.setAttribute("bvo", bvo);
			request.setAttribute("list", list);
			view = "/admin/managePost.jsp";
		} else {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));			
			int proNum = Integer.parseInt(request.getParameter("proNum"));			
			BoardService service = new BoardService();
			System.out.println(proNum);
			if(proNum == 1) {
				service.Recovery(boardNum);
			} else if(proNum == 2) {
				service.Stop(boardNum);
			}
			
			JSONObject obj = new JSONObject();
			obj.put("proNum", proNum);
			String txt = obj.toJSONString();

			view = "responsebody/" + txt;
		}
		return view;
	}

}

package handler.admin;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class ManageHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String view = "";
		BoardService service = new BoardService();
		ArrayList<BoardVo> all = service.getYCard3();
		ArrayList<BoardVo> list = new ArrayList<>();
		if (request.getMethod().equals("GET")) { // 처음 올 때 (동기방식, 처리중)
			// 처리중
			for (BoardVo vo : all) {
				if (vo.getProcess() != 2) {
					list.add(vo);
				}
			}
			
			request.setAttribute("list", list);
			request.setAttribute("view", "/admin/adminPage.jsp");
			
			view = "/main.jsp";
			
		} else { // 콤보박스 비동기로 올 때 (처리중)
			System.out.println("처리중 왔습니다~");
			
 			JSONArray arr = new JSONArray();
 			for (BoardVo vo : all) {
 				if (vo.getProcess() != 2) {
 					JSONObject obj = new JSONObject();
 					obj.put("boardNum", vo.getBoardNum());
 					obj.put("title", vo.getTitle());
 					obj.put("memberId", vo.getMemberId());
 					arr.add(obj);
 				}
 			}
			
			String txt = arr.toJSONString();

			view = "responsebody/" + txt;

		}
		return view;
	}

}

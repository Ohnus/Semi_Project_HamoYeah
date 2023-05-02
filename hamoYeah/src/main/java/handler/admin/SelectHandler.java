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

public class SelectHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
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
		if (request.getMethod().equals("GET")) { // 콤보박스에서 복구 누르면 옴.
			System.out.println("복구 왔습니다~");
			ArrayList<BoardVo> list = service.getRecovery();
			JSONArray arr = new JSONArray();
			for (BoardVo vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("boardNum", vo.getBoardNum());
				obj.put("title", vo.getTitle());
				obj.put("memberId", vo.getMemberId());
				arr.add(obj);
			}

			String txt = arr.toJSONString();

			view = "responsebody/" + txt;

		} else { // 콤보박스에서 정지 누르면 옴.
			System.out.println("정지 왔습니다~");
			ArrayList<BoardVo> all = service.getYCard3();

			JSONArray arr = new JSONArray();
			for (BoardVo vo : all) {
				if (vo.getProcess() == 2) {
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

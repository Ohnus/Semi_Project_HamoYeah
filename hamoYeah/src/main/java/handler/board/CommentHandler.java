package handler.board;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import comment.CommentService;
import comment.CommentVo;
import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class CommentHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 한글 인코딩
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//댓글 추가
		String memberId = request.getParameter("memberId");
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String comment = request.getParameter("content");
		//int repNum = Integer.parseInt(request.getParameter("repNum")); // 삭제
		int reRepNum = Integer.parseInt(request.getParameter("reRepNum"));
		CommentVo vo = new CommentVo(memberId, boardNum, 0, reRepNum, comment); // repNum 0으로 추가
		
		System.out.println("comment handler:" + vo);

		CommentService service = new CommentService();
		service.addComment(vo);
		
		ArrayList<CommentVo> reps = service.getByboardNum(boardNum); //원글 번호로 원글에 달린 댓글 전부 불러오기
		JSONArray arr = new JSONArray();
		for (CommentVo cvo : reps) {
		    JSONObject obj = new JSONObject();
		    //obj.put("imagepath", mvo.getImagepath());
		    obj.put("memberId", cvo.getMemberId());
		    obj.put("content", cvo.getContent());
		    obj.put("repNum", cvo.getRepNum()); // repNum 변수 추가
		    arr.add(obj);
		}
		String txt = arr.toJSONString();

		
		return "responsebody/" + txt; // JSON 형식으로 반환
	}

}

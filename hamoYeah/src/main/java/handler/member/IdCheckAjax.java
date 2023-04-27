package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class IdCheckAjax implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("memberId");
		HMemberService service = new HMemberService();
		HMemberVo vo = service.getHMember(id);
		boolean flag = (vo==null);
		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		String txt = obj.toJSONString();
		
		return "responsebody/" + txt;
	}
}

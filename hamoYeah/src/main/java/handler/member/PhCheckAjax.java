package handler.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class PhCheckAjax implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		HMemberService service = new HMemberService();
		HMemberVo vo = service.getHMemberByPhone(phone);
		boolean flag = (vo==null);
		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		String txt = obj.toJSONString();
		
		return "responsebody/" + txt;
	}

}

package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class EditCheckHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String view = "";

		int flag = -1;// 1:핸드폰번호중복, 2:닉네임중복
		String checkId = request.getParameter("memberId");
		String checkPhone = request.getParameter("phone");
		String checkNname = request.getParameter("nickname");
		HMemberService service = new HMemberService();
		HMemberVo voId = service.getHMember(checkId);
		HMemberVo voPhone = service.getHMemberByPhone(checkPhone);
		HMemberVo voNickname = service.getHMemberByNickname(checkNname);
		for (int i = 0; i < 1; i++) {
			if (voPhone == null || checkPhone.equals(voId.getPhone())) {
				flag = 0;
			} else {
				flag = 1;
				continue;
			}

			if (voNickname == null || checkNname.equals(voId.getNickname())) {
				flag = 0;
			} else {
				flag = 2;
				continue;
			}
		}

		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		String txt = obj.toJSONString();

		view = "responsebody/" + txt;

		return view;
	}
}

package handler.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class JoinAjaxHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		if (request.getMethod().equals("GET")) {
			view = "/member/join.jsp"; // include 안하고 회원가입 페이지로 따로 이동
		} else {
			int flag = -1;// 0:id중복, 1:핸드폰번호중복, 2:닉네임중복
			String checkId = request.getParameter("memberId");
			String checkPhone = request.getParameter("phone");
			String checkNname = request.getParameter("nickname");
			HMemberService service = new HMemberService();
			HMemberVo voId = service.getHMember(checkId);
			HMemberVo voPhone = service.getHMemberByPhone(checkPhone);
			HMemberVo voNickname = service.getHMemberByNickname(checkNname);
			for (int i = 0; i < 1; i++) {
				if (voId == null ) {
					flag = 0;
				} else {
					flag = 1;
					continue;
				}
				
				if (voPhone == null) {
					flag = 0;
				} else {
					flag = 2;
					continue;
				}
				
				if (voNickname == null) {
					flag = 0;
				} else {
					flag = 3;
					continue;
				}
			}

			JSONObject obj = new JSONObject();
			obj.put("flag", flag);
			String txt = obj.toJSONString();

			view = "responsebody/" + txt;
		}
		return view;
	}
}

package handler.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class MypageHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		if (request.getMethod().equals("GET")) {
			String memberId = request.getParameter("memberId");
			HMemberService service = new HMemberService();
			HMemberVo vo = service.getHMember(memberId);
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/member/passwordcheck.jsp");
			view = "/main.jsp";
		} else {
			String memberId = request.getParameter("memberId");
			HMemberService service = new HMemberService();
			HMemberVo vo = service.getHMember(memberId);
			String phone = vo.getPhone();
			String phone1 = phone.substring(0, 3); // 010
			String phone2 = phone.substring(3, 7); // 0000
			String phone3 = phone.substring(7); // 0000
			request.setAttribute("phone1", phone1);
			request.setAttribute("phone2", phone2);
			request.setAttribute("phone3", phone3);
			ArrayList<String> tag = new ArrayList<>();
			tag.add(vo.getTag1());
			tag.add(vo.getTag2());
			tag.add(vo.getTag3());
			request.setAttribute("tag", tag);
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/member/editInfo.jsp");
			view = "/main.jsp";
		}
		return view;
	}
}

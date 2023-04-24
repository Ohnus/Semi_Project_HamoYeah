package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/member/memberform.jsp");
			view = "/main.jsp";
		}
		return view;
	}
}

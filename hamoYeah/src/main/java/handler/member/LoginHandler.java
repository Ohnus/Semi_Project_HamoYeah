package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class LoginHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		if (request.getMethod().equals("GET")) {
//			request.setAttribute("view", "/member/login.jsp");
			view = "/member/login.jsp";
		} else {
			String memberId = request.getParameter("memberId");
			String pwd = request.getParameter("pwd");
			HMemberService service = new HMemberService();
			HMemberVo vo = service.getHMember(memberId);
			if (vo != null && pwd.equals(vo.getPwd())) {// 로그인 체크
				HttpSession session = request.getSession();// 세션 획득
				session.setAttribute("loginId", memberId);// loginId는 로그아웃할때까지 세션에 남아있음
				if (memberId.equals("H_admin")) {
					// 신고만들어지면 신고글 불러와서 setAttribute에 담고 관리자페이지로 보내기
					view = "/admin/adminPage.jsp";
				} else {
					view = "/main.jsp";
				}
			}
		}
		return view;
	}
}

package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.HMemberService;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String memberId = request.getParameter("memberId");
		HMemberService service = new HMemberService();
		service.delete(memberId);
		return "redirect:/member/logout.do";
	}

}

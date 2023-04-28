package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;

public class LogoutHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);//새 세션 말고 쓰던 세션 가져와라
		session.invalidate();//세션 무효화
		return "redirect:/board/boardAllList.do";
	}

}

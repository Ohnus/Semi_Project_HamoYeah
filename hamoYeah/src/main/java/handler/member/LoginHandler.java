package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
			int flag = -1;//0:아이디 불일치, 1:pwd 불일치, 2:관리자로그인성공 3:멤버로그인성공
			if(vo == null) {
				flag = 0;
			} else {
				if(pwd.equals(vo.getPwd()) && memberId.equals("master")){
					flag = 2;
					HttpSession session = request.getSession();
					session.setAttribute("loginId", memberId);
				} else if(pwd.equals(vo.getPwd())){
					flag = 3;
					HttpSession session = request.getSession();
					session.setAttribute("loginId", memberId);
				} else {
					flag = 1;
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

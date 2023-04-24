package handler.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class EditHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String view = "";
		if (request.getMethod().equals("GET")) {
			String memberId = request.getParameter("memberId");
			HMemberService service = new HMemberService();
			HMemberVo vo = service.getHMember(memberId);
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/member/editInfo.jsp");
			view = "/main.jsp";
		} else {

			int size = 100 * 1024 * 1024; // 100M

			MultipartRequest multipart = null;
			try {
				multipart = new MultipartRequest(request, HMemberService.path, size, "UTF-8", new DefaultFileRenamePolicy());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String memberId = request.getParameter("memberId");
			String pwd = multipart.getParameter("pwd");
			String phone = multipart.getParameter("phone");
			String age = multipart.getParameter("age");
			String nickname = multipart.getParameter("nickname");
			String tag1 = multipart.getParameter("tag");
			String tag2 = multipart.getParameter("tag");
			String tag3 = multipart.getParameter("tag");
			String intro = multipart.getParameter("intro");
			
			File f = multipart.getFile("imagepath");
			String imagepath = "\\HmemberImg\\"+f.getName();
			
			HMemberService service = new HMemberService();
			service.editInfo(new HMemberVo(memberId, pwd, "", phone, nickname, "", age, intro, tag1, tag2, tag3, imagepath));
			
			HMemberVo vo = service.getHMember(memberId);
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/member/memberform.jsp");
			view = "/main.jsp";
		}
		return view;
	}
}

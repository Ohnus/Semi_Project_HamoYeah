package handler.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			HMemberService service = new HMemberService();
			HMemberVo vo = service.getHMember(memberId);
			String pwd = multipart.getParameter("pwd");
			String resetpwd = "";
			if(pwd.equals("")) {
				resetpwd = vo.getPwd();
			} else {
				resetpwd = pwd;
			}
			String phone1 = multipart.getParameter("phone1");
			String phone2 = multipart.getParameter("phone2");
			String phone3 = multipart.getParameter("phone3");
			String phone = phone1 + phone2 + phone3;
			String nickname = multipart.getParameter("nickname");
			String age = multipart.getParameter("age");
			String[] tagVal = multipart.getParameterValues("tag");
			String tag1 = null;
			String tag2 = null;
			String tag3 = null;
			if (tagVal != null) {
				if (tagVal.length > 0) {
					tag1 = tagVal[0];
				}
				if (tagVal.length > 1) {
					tag2 = tagVal[1];
				}
				if (tagVal.length > 2) {
					tag3 = tagVal[2];
				}
			}
			String intro = multipart.getParameter("intro");
			File f = multipart.getFile("imagepath");
			String imagepath = "";
			if (f == null) {
				imagepath = vo.getImagepath();  // 회원정보 수정할 때 이미지 수정없이 수정하면 기존 이미지 유지하기
			} else {
				// 회원 정보 수정할 때 이미지도 수정하면 기존에 있던 이미지 파일 삭제
				// db에는 수정된 imagepath만 등록되므로 db삭제는 안해도 될 듯?
				String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\";
				String delimg = path + vo.getImagepath();
				f = new File(delimg);
				f.delete();

				imagepath = "\\HmemberImg\\" + f.getName();
			}
			service = new HMemberService();
			service.editInfo(new HMemberVo(memberId, resetpwd, "", phone, nickname, "", age, intro, tag1, tag2, tag3, imagepath));
			
			vo = service.getHMember(memberId);
			request.setAttribute("vo", vo);
//			request.setAttribute("view", "/member/editInfo.jsp");
			view = "redirect:/member/mypage.do?memberId=" + memberId;
		}
		return view;
	}
}
package handler.member;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\";
		String memberId = request.getParameter("memberId");
		HMemberService service = new HMemberService();
		HMemberVo vo = service.getHMember(memberId);
		// 회원탈퇴하면 회원 이미지파일 삭제
		// 탈퇴하면 회원 자체가 사라지므로 db삭제 불필요
		String delimg = path + vo.getImagepath();
		File f = new File(delimg);
		f.delete();
		
		service.delete(memberId);
		return "redirect:/member/logout.do";
	}

}
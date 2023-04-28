package handler.review;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import review.reviewService;
import review.reviewVo;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		// TODO Auto-generated method stub
		String view = "";

		if (request.getMethod().equals("GET")) {
			//participate.jsp에서 값 불러오기		
			
			//보드의 
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			BoardService bservice = new BoardService();
			BoardVo vo = bservice.getByBoardNum(boardNum);
						
			//작성자(session.loginId)가 안당겨짐
			//보드의 태그가 안당겨짐
			//원글번호가 안당겨짐
				
			request.setAttribute("vo", vo);
			view = "/review/add.jsp";
			
			
		} else {
			
			int size = 100 * 1024 * 1024;

			String path = "C:\\Users\\Heesoo KIM\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";

			MultipartRequest multipart = null;
			try {
				multipart = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 폼파라미터 읽기
			String memberId = multipart.getParameter("memberId");
			int boardNum = Integer.parseInt(multipart.getParameter("boardNum"));
			String content = multipart.getParameter("content");
			String tag = multipart.getParameter("tag");
			

			// 업로드된 파일객체 반환
			File f = multipart.getFile("imagepath");
			String fname = "\\img\\" + f.getName();
			System.out.println(memberId);
			System.out.println(boardNum);
			System.out.println(content);
			System.out.println(tag);
			System.out.println(fname);
			
			reviewService service = new reviewService();
			service.addReview(new reviewVo(memberId, 0, boardNum, null, 0, fname, content, tag));
			
			view = "redirect:/review/list.do";
			
		}
		return view;
	}
}

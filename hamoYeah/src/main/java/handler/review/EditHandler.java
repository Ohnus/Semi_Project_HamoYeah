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

public class EditHandler implements Handler {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		String view = "";
		if (request.getMethod().equals("GET")) { // 수정 버튼 누르면 기존 게시글의 정보를 담아서 수정 폼으로 이동

			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			System.out.println(reviewNum);
			reviewService service = new reviewService();
			reviewVo vo = service.getByReviewNum(reviewNum);
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/review/edit.jsp");
			view = "/main.jsp";
			
		} else {
			int size = 100 * 1024 * 1024; // 100M
			
			MultipartRequest multipart;

			try {
				multipart = new MultipartRequest(request, reviewService.path, size, "UTF-8",
						new DefaultFileRenamePolicy());
				// 폼파라메터 읽기
				
				int reviewNum = Integer.parseInt(multipart.getParameter("reviewNum"));
				String content = multipart.getParameter("content");
				
				reviewService service = new reviewService();
				reviewVo vo = service.getByReviewNum(reviewNum);
				
				// 업로드된 파일의 파일객체 반환
				File f = multipart.getFile("imagepath");
				
				// 이미지 수정 안했을 경우(받아올 값이 없을 경우): 이름이 있으면 즉, 이미지를 수정했으면 새로운 경로 생성 / 아니라면 기존 글의 경로를 넣어줌
				String fname = "";
				if (f == null) {
					fname = vo.getImagepath();  // 수정할 때 이미지 수정없이 수정하면 기존 이미지 유지하기
				} else {
					// 정보 수정할 때 이미지도 수정하면 기존에 있던 이미지 파일 삭제
					// db에는 수정된 imagepath만 등록되므로 db삭제는 안해도 될 듯?
					String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\";
					String delimg = path + vo.getImagepath();
					File f2 = new File(delimg);
					f2.delete();

					fname = "\\HmemberImg\\" + f.getName();
				}

				service.editReview(new reviewVo(null,reviewNum,0,null,0,fname,content,null));

				view = "redirect:/review/detail.do?reviewNum="+reviewNum;

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return view;
	}
}

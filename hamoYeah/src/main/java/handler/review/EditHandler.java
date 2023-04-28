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

		String view = "/review/edit.jsp";
		if (request.getMethod().equals("GET")) { // 수정 버튼 누르면 기존 게시글의 정보를 담아서 수정 폼으로 이동

			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			System.out.println(reviewNum);
			reviewService service = new reviewService();
			reviewVo vo = service.getByReviewNum(reviewNum);
			request.setAttribute("vo", vo);
			request.setAttribute("view", "/review/edit.jsp");
			
			
		} else {
			int size = 100 * 1024 * 1024; // 100M

			MultipartRequest multipart;

			try {
				multipart = new MultipartRequest(request, BoardService.path, size, "UTF-8",
						new DefaultFileRenamePolicy());
				// 폼파라메터 읽기
				String memberId = multipart.getParameter("memberId");
				
				int boardNum = Integer.parseInt(multipart.getParameter("boardNum"));
				
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");
				String imagepath = multipart.getParameter("imagepath");
				String place = multipart.getParameter("place");
				String dDay = multipart.getParameter("dDay");
				String tag = multipart.getParameter("tag");
				int peopleMax = Integer.parseInt(multipart.getParameter("peopleMax"));
				
				BoardService service = new BoardService();
				
				// 업로드된 파일의 파일객체 반환
				File f = multipart.getFile("imagepath");
				
				// 이미지 수정 안했을 경우(받아올 값이 없을 경우): 이름이 있으면 즉, 이미지를 수정했으면 새로운 경로 생성 / 아니라면 기존 글의 경로를 넣어줌
				String fname = null;
				if (f != null) {
					fname = "\\img\\" + f.getName();
				}else {
					BoardVo vo = service.getByBoardNum(boardNum);
					fname = vo.getImagepath();
				}

				service.editBoard(
						new BoardVo(null, boardNum, null, title, content, fname, place, dDay, tag, peopleMax, 0, 0, 0));

				BoardVo vo = service.getByBoardNum(boardNum);
				request.setAttribute("vo", vo);

				view = "redirect:/board/boardDetail.do?boardNum=" + boardNum;

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return view;
	}
}

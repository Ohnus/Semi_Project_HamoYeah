package handler.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class EditBoardHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String view = "/main.jsp";
		if (request.getMethod().equals("GET")) { // 수정 버튼 누르면 기존 게시글의 정보를 담아서 수정 폼으로 이동

			int boardNum = Integer.parseInt(request.getParameter("boardNum"));

			BoardService service = new BoardService();
			BoardVo vo = service.getByBoardNum(boardNum);

			request.setAttribute("vo", vo);
			request.setAttribute("view", "/board/editBoard.jsp"); // 이동할 뷰페이지

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
				String tag = multipart.getParameter("tag");
				int peopleMax = Integer.parseInt(multipart.getParameter("peopleMax"));
			
				
				BoardService service = new BoardService();
				BoardVo vo = service.getByBoardNum(boardNum);
				
				// 업로드된 파일의 파일객체 반환
				File f = multipart.getFile("imagepath");
				
				// 이미지 수정 안했을 경우(받아올 값이 없을 경우): 이름이 있으면 즉, 이미지를 수정했으면 새로운 경로 생성 / 아니라면 기존 글의 경로를 넣어줌
				String fname = null;
				if (f != null) {
					String path = "/Users/choeyeeun/Desktop/web_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps";
					String delimg = path + vo.getImagepath();
					File f2 = new File(delimg);
					f2.delete();
					fname = "/img/" + f.getName();
				}else {
					fname = vo.getImagepath();
				}

				service.editBoard(
						new BoardVo(null, boardNum, null, title, content, fname, place, null, tag, peopleMax, 0, 0, 0));

//				BoardVo vo = service.getByBoardNum(boardNum);
//				request.setAttribute("vo", vo);

				view = "redirect:/board/boardDetail.do?boardNum=" + boardNum + "&memberId=" + memberId;

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return view;
	}

}

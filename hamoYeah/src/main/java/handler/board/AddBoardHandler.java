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

public class AddBoardHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		String view = "/main.jsp";
		if (request.getMethod().equals("GET")) {// request.getMethod(): 요청 방식(get/post)값 반환
			request.setAttribute("view", "/board/addBoard.jsp");
		} else {
			int size = 100 * 1024 * 1024; // 100M
			MultipartRequest multipart;
			try {
				multipart = new MultipartRequest(request, BoardService.path, size, "UTF-8", new DefaultFileRenamePolicy());
				// 폼파라메터 읽기
				String memberId = multipart.getParameter("memberId");
				String title = multipart.getParameter("title");
				String content = multipart.getParameter("content");
				String imagepath = multipart.getParameter("imagepath");
				String place = multipart.getParameter("place");
				String dDay = multipart.getParameter("dDay");
				String tag = multipart.getParameter("tag");
				int peopleMax = Integer.parseInt(multipart.getParameter("peopleMax"));
				int y_card = 0;
				int process = 0;
				int ok = 0;
				
				String year = dDay.substring(2, 4);
				String month = dDay.substring(5,7);
				String day = dDay.substring(8,10);
				String time = dDay.substring(11, 16);
				dDay = year + "/" + month + "/" + day + " " + time;

				// 업로드된 파일의 파일객체 반환
				File f = multipart.getFile("imagepath");
				// getName(): 파일명 반환
				String fname = "/img/" + f.getName();
				
				BoardService service = new BoardService();
				service.addBoard(new BoardVo(memberId, 0, null, title, content, fname, place, dDay, tag, peopleMax, y_card, process, ok));
				
				view = "redirect:/board/boardAllList.do?memberId="+memberId;
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return view;
	}

}


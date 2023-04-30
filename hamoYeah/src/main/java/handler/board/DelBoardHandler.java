package handler.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class DelBoardHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String path = "/Users/choeyeeun/Desktop/web_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps";
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String memberId = request.getParameter("memberId");
		
		BoardService service = new BoardService();
		BoardVo bvo = service.getByBoardNum(boardNum);
		String img = path + bvo.getImagepath();
		File f = new File(img);
		f.delete(); // 저장된 이미지 삭제 
		service.delBoard(boardNum); // db에서 게시물 삭제 
		
		return "redirect:/board/host.do?memberId="+memberId;
	}

}

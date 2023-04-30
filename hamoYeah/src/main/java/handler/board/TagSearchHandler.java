package handler.board;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import favorites.FavoritesService;
import favorites.FavoritesVo;
import handler.Handler;

public class TagSearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String tag = request.getParameter("id");
		
		BoardService service = new BoardService();
		ArrayList<BoardVo> list = service.getByTag(tag);
		
		FavoritesVo fvo = new FavoritesVo();
		FavoritesService servFav = new FavoritesService();
		// 삼항 연산자 : 타입 변수명 = ( 조건문 ) ? 참일 때 : 거짓일 때;
		String memberId = (request.getParameter("memberId") == null) ? "" : request.getParameter("memberId");
		if (memberId.equals("null")) { // 로그인 되어 있지 않으면 즐겨찾기 회색.
			for(BoardVo bvo:list) {
				bvo.setFav(0);
			}
		} else { // 로그인 되어 있으면 즐겨찾기 비교.
			for(BoardVo bvo:list) {
				fvo = servFav.getFavVo(bvo.getBoardNum(), memberId);
				if (fvo == null) {
					bvo.setFav(0);
				} else {
					bvo.setFav(1);
				}
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("view", "/board/boardAllList.jsp");
		
		return "/main.jsp";
		
		
	}

}

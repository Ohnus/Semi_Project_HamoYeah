package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import favorites.FavoritesService;
import favorites.FavoritesVo;
import handler.Handler;
import member.HMemberVo;
import participate.ParticipateService;

public class ListAllHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BoardService service = new BoardService();
		ArrayList<BoardVo> list = service.getAllBoard();
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
		
		// ok 갱신 
		ParticipateService servPar = new ParticipateService();
		BoardService servBoard = new BoardService();
		int cnt = 0;
		for (int i = 0; i < list.size(); i++) {
			BoardVo bvo = list.get(i);
			ArrayList<String> parList = servPar.getOk1(bvo.getBoardNum()); // ok=1인 memberId만 리스트 담기
			for (int j = 0; j < parList.size(); j++) {
				cnt++;
			}
			bvo.setOk(cnt);
			servBoard.EditParticipate(bvo);
			cnt = 0;
		}
		
		
		request.setAttribute("list", list);
		request.setAttribute("view", "/board/boardAllList.jsp");
		
		return "/main.jsp";

	}

}




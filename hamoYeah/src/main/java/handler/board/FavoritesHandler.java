package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.BoardService;
import board.BoardVo;
import favorites.FavoritesService;
import favorites.FavoritesVo;
import handler.Handler;
import participate.ParticipateService;

public class FavoritesHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
//		String memberId = request.getParameter("memberId");
		String memberId = "aaa";
		BoardService servBoard = new BoardService();
		FavoritesService servFav = new FavoritesService();
		ParticipateService servPar = new ParticipateService();
		BoardVo bvo = new BoardVo();
		FavoritesVo fvo = new FavoritesVo();

		if (request.getMethod().equals("GET")) {
			servFav.deleteCnt1(memberId); // delCnt 가 1인 게시글 지우기
			
			ArrayList<FavoritesVo> listFav = servFav.getFavList(memberId); // 즐겨찾기 불러오기.
			ArrayList<BoardVo> listOff = servBoard.getByComplete(); // 완료된 모임 전체 리스트
			ArrayList<BoardVo> finalList = new ArrayList<>(); // 최종으로 담을 리스트 
			
			if (listOff.size() == 0) { // 완료된 모임 검색된 게 없으면 
				for (int j = 0; j < listFav.size(); j++) {
					fvo = listFav.get(j);
					bvo = servBoard.getByBoardNum(fvo.getBoardNum());
					finalList.add(bvo);
				}
			} else { // 검색된 게시글이 있으면 
				for (int j = 0; j < listOff.size(); j++) {
					bvo = listOff.get(j);
					for (int i = 0; i < listFav.size(); i++) {
						fvo = listFav.get(i);
						if (bvo.getBoardNum() == fvo.getBoardNum()) {
							servFav.deleteEnd(fvo.getBoardNum()); // 즐겨찾기 중 완료된거 삭제
						} 
					}
				}
			}
			
			listFav = servFav.getFavList(memberId); // 삭제되지 않은 즐겨찾기만 다시 검색.
			for (int i=0; i<listFav.size(); i++) {
				fvo = listFav.get(i);
				bvo = servBoard.getByBoardNum(fvo.getBoardNum()); // 즐겨찾기 글번호로 게시글 불러오기.
				finalList.add(bvo);
			}

			// 참가승인된 사람 수를 ok 변수에 넣기.
			int cnt = 0;
			for (int i = 0; i < finalList.size(); i++) {
				bvo = finalList.get(i);
				ArrayList<String> parList = servPar.getOk1(bvo.getBoardNum()); // ok=1인 memberId만 리스트 담기
				for (int j = 0; j < parList.size(); j++) {
					cnt++;
				}
				bvo.setOk(cnt);
				servBoard.EditParticipate(bvo);
				cnt = 0;
			}
			

			request.setAttribute("finalList", finalList);
			request.setAttribute("view", "/board/favorites.jsp");
			view = "/main.jsp";

		} else { // 즐겨찾기 버튼을 누름 -- post 방식으로 옴.
			
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			fvo = servFav.getFavVo(boardNum, memberId);
			
			int color = 0;
			if (fvo.getDelCnt() == 0) { // 노란버튼 누름 (즐겨찾기 취소)
				servFav.editDel0to1(fvo);
				color = 1;
			} else { // 회색버튼 누름 (취소 되돌리기)
				servFav.editDel1to0(fvo);
			}

			JSONObject obj = new JSONObject();
			obj.put("color", color);
			String txt = obj.toJSONString();

			view = "responsebody/" + txt;
		}
		return view;
	}

}

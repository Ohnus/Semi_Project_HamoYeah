package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import participate.ParticipateService;
import participate.ParticipateVo;

public class ParticipateListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String memberId = request.getParameter("memberId");
		BoardService servBoard = new BoardService();
		ParticipateService servPar = new ParticipateService();
		BoardVo bvo = new BoardVo();

		ArrayList<ParticipateVo> pvoList = servPar.getPvo(memberId);
		ArrayList<BoardVo> on = servBoard.getByOngoing(); // 진행중인 전체 리스트
		ArrayList<BoardVo> off = servBoard.getByComplete(); // 완료된 전체 리스트

		// 진행중인 모임 - 미승인/승인/거절 표시
		// 완료된 모임 - 승인나서 참여한 모임중 끝난거만. -- participate 의 ok가 1인것만.

		// 진행중인 리스트 중 boardNum 같은거를 listOn에 담기
		ArrayList<BoardVo> listOn0 = new ArrayList<>();
		ArrayList<BoardVo> listOn1 = new ArrayList<>();
		ArrayList<BoardVo> listOn2 = new ArrayList<>();
		for (ParticipateVo pvo : pvoList) {
			for (BoardVo vo : on) {
				if (pvo.getBoardNum() == vo.getBoardNum()) {
					if(pvo.getOk()==0) { // 미승인 리스트 
						listOn0.add(vo);
					} else if(pvo.getOk()==1) {
						listOn1.add(vo);
					} else {
						listOn2.add(vo);
					}
				}
			}
		}
		

		// 완료된 리스트 중 boardNum 같은거를 listOff에 담기
		ArrayList<BoardVo> listOff = new ArrayList<>(); // 완료중인 주최 리스트 담을거.
		for (ParticipateVo pvo : pvoList) {
			for (BoardVo vo : off) {
				if (pvo.getBoardNum() == vo.getBoardNum() && pvo.getOk()==1) {
					listOff.add(vo);
				}
			}
		}		
		
		
		// 참가승인된 사람 수를 ok 변수에 넣기.
		// 진행중인 리스트
		int cnt = 0;
		
		for (int i = 0; i < listOn0.size(); i++) {
			bvo = listOn0.get(i);
			ArrayList<String> parList = servPar.getOk1(bvo.getBoardNum()); // ok=1인 memberId만 리스트 담기
			for (int j = 0; j < parList.size(); j++) {
				cnt++;
			}
			bvo.setOk(cnt);
			servBoard.EditParticipate(bvo);
			cnt = 0;
		}
		for (int i = 0; i < listOn1.size(); i++) {
			bvo = listOn1.get(i);
			ArrayList<String> parList = servPar.getOk1(bvo.getBoardNum()); // ok=1인 memberId만 리스트 담기
			for (int j = 0; j < parList.size(); j++) {
				cnt++;
			}
			bvo.setOk(cnt);
			servBoard.EditParticipate(bvo);
			cnt = 0;
		}
		for (int i = 0; i < listOn2.size(); i++) {
			bvo = listOn2.get(i);
			ArrayList<String> parList = servPar.getOk1(bvo.getBoardNum()); // ok=1인 memberId만 리스트 담기
			for (int j = 0; j < parList.size(); j++) {
				cnt++;
			}
			bvo.setOk(cnt);
			servBoard.EditParticipate(bvo);
			cnt = 0;
		}
		// 완료된 리스트
		for (int i = 0; i < listOff.size(); i++) {
			bvo = listOff.get(i);
			ArrayList<String> parList = servPar.getOk1(bvo.getBoardNum()); // ok=1인 memberId만 리스트 담기
			for (int j = 0; j < parList.size(); j++) {
				cnt++;
			}
			
			bvo.setOk(cnt);
			servBoard.EditParticipate(bvo);
			cnt = 0;
		}

		request.setAttribute("listOn0", listOn0);
		request.setAttribute("listOn1", listOn1);
		request.setAttribute("listOn2", listOn2);
		request.setAttribute("listOff", listOff);

		request.setAttribute("view", "/board/participateList.jsp");
		return "/main.jsp";
	}

}

package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import participate.ParticipateService;

public class HostHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String memberId = request.getParameter("memberId");

		BoardService servBoard = new BoardService();
		ParticipateService servPar = new ParticipateService();
		BoardVo bvo = new BoardVo();
		
		ArrayList<BoardVo> on = servBoard.getByOngoing(); // 진행중인 전체 리스트
		ArrayList<BoardVo> off = servBoard.getByComplete(); // 완료된 전체 리스트
		
//		for(BoardVo vo:on) {
//			System.out.println("on:"+vo);
//		}
//		for(BoardVo vo:off) {
//			System.out.println("off:"+vo);
//		}
		
		
		// 진행중인 리스트 중 멤버아이디가 같은거를 listOn에 담기
		ArrayList<BoardVo> listOn = new ArrayList<>(); // 진행중인 주최 리스트 담을거.
		for (BoardVo vo:on) {
			if(vo.getMemberId().equals(memberId)) {
				listOn.add(vo);				
			}
		}
		
		// 완료된 리스트 중 멤버아이디가 같은거를 listOff에 담기
		ArrayList<BoardVo> listOff = new ArrayList<>(); // 완료된 주최 리스트 담을거.
		for (BoardVo vo:off) {
			if(vo.getMemberId().equals(memberId)) {
				listOff.add(vo);				
			}
		}
		
		// 참가승인된 사람 수를 ok 변수에 넣기.
		// 진행중인 리스트 
		int cnt = 0;
		for (int i = 0; i < listOn.size(); i++) {
			bvo = listOn.get(i);
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
		
//		for(BoardVo vo:listOn) {
//			System.out.println("listOn:"+vo);
//		}
//		for(BoardVo vo:listOff) {
//			System.out.println("listOff:"+vo);
//		}

		request.setAttribute("listOn", listOn);
		request.setAttribute("listOff", listOff);
		request.setAttribute("view", "/board/hostList.jsp");
		return "/main.jsp";
	}

}

package handler.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import member.HMemberService;
import member.HMemberVo;
import participate.ParticipateService;
import participate.ParticipateVo;

public class OkListHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		ParticipateService servPar = new ParticipateService();
		HMemberService servMember = new HMemberService();
		BoardService servBoard = new BoardService();
		HMemberVo mvo = new HMemberVo();
		BoardVo bvo = servBoard.getByBoardNum(boardNum);

		if (request.getMethod().equals("GET")) {
			// 미승인된 참여자 select
			ArrayList<String> listOk0 = servPar.getOk0(boardNum); // memberId select
			ArrayList<HMemberVo> list0 = new ArrayList<>();
			// MemberService에서 listOk0 에 담긴 memberId로 Vo 호출해서 list0에 담기
			for (String memberId : listOk0) {
				mvo = servMember.getHMember(memberId);
				list0.add(mvo);
			}

			// 승인된 참여자 select
			ArrayList<String> listOk1 = servPar.getOk1(boardNum); // memberId select
			ArrayList<HMemberVo> list1 = new ArrayList<>();
			// MemberService에서 listOk0 에 담긴 memberId로 Vo 호출해서 list0에 담기
			for (String memberId : listOk1) {
				mvo = servMember.getHMember(memberId);
				list1.add(mvo);
			}

			// bvo.getPeopleMax - list1.size() 수 담기..
			int rest = bvo.getPeopleMax() - list1.size(); // 앞으로 더 승인해야 할 사람 수.

			// 모임 제목
			String title = bvo.getTitle();
			int max = bvo.getPeopleMax();
			int now = list1.size();

			request.setAttribute("max", max);
			request.setAttribute("now", now);
			request.setAttribute("title", title); // 타이틀
			request.setAttribute("rest", rest); // 더 필요한 승인 수
			request.setAttribute("boardNum", boardNum);
			request.setAttribute("list0", list0); // 미승인
			request.setAttribute("list1", list1); // 승인
			request.setAttribute("view", "/member/okList.jsp"); // forward 이동일 때는 경로만 씀.
			view = "/main.jsp";

		} else { // 승인하기 버튼 누름
			System.out.println("왔습니다~");
			String[] idArr = request.getParameterValues("check");

			for (String id : idArr) {
				// checkbox 값 가지고 왔는지 확인하기~
				System.out.println(id);
				ArrayList<ParticipateVo> pvoList = servPar.getPvo(id);
				for (ParticipateVo pvo : pvoList) {
					if (boardNum == pvo.getBoardNum()) {
						// 선택한 사람(파람) ok update (0->1)
						servPar.editOk1(pvo);
					}
				}
			}
			// board의 ok 값 갱신
			int cnt = 0;
			ArrayList<String> parList = servPar.getOk1(boardNum); // ok=1인 memberId만 리스트 담기
			for (int i = 0; i < parList.size(); i++) {
				cnt++;
			}
			bvo.setOk(cnt);
			servBoard.EditParticipate(bvo);
			


			// 승인 인원이 다 찼을 때 아직 ok가 0인 사람은 2로 update
			if (bvo.getOk()==bvo.getPeopleMax()) {
				ArrayList<String> id0 = servPar.getOk0(boardNum); // ok 0인 사람 불러오기 
				for (String id:id0) {
					ArrayList<ParticipateVo> pvoList = servPar.getPvo(id);
					for (ParticipateVo pvo : pvoList) {
						servPar.editOk2(pvo);
					}
				}
			}

				view = "redirect:/member/okList.do?boardNum=" + boardNum;
		}

		return view;
	}

}

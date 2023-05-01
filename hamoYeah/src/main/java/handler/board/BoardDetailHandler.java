package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.BoardService;
import board.BoardVo;
import comment.CommentService;
import comment.CommentVo;
import favorites.FavoritesService;
import favorites.FavoritesVo;
import handler.Handler;
import member.HMemberService;
import member.HMemberVo;
import participate.ParticipateService;
import participate.ParticipateVo;

public class BoardDetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		int boardNum = Integer.parseInt(request.getParameter("boardNum")); // 게시글 번호 빨리 받아와
		ParticipateService servPar = new ParticipateService();
		FavoritesService servFav = new FavoritesService();
		HMemberService servMember = new HMemberService();

		if (request.getMethod().equals("GET")) {

			// 이미지, 작성자 정보, 제목, 내용, 참여자 리스트, 참여신청버튼, 댓글창, 목록버튼, 즐겨찾기, 신고

			// 게시글 가져오기
			BoardService boardService = new BoardService();
			BoardVo boardvo = boardService.getByBoardNum(boardNum);
			
			// 승인된 참여자 select
			ArrayList<String> listOk1 = servPar.getOk1(boardNum); // memberId select
			
			// 참여자 리스트 화면에 보여줌 (member 테이블의 정보를 가져와야 함)
			ArrayList<HMemberVo> list1 = new ArrayList<>();
			for (String id : listOk1) {
				HMemberVo mvo = servMember.getHMember(id);
				list1.add(mvo);
			}
			boardvo.setMvolist(list1); // 승인된 멤버 정보 갱신 
			boardvo.setOk(list1.size()); // boardvo의 ok 갱신 

			// 게시글 작성자 정보 가져오기
			HMemberService service1 = new HMemberService();
			HMemberVo membervo = service1.getHMember(boardvo.getMemberId());

			// 로그인 한 사람의 즐겨찾기 여부 확인.
			String memberId = (request.getParameter("memberId") == null) ? "" : request.getParameter("memberId");
			FavoritesVo fvo = servFav.getFavVo(boardNum, memberId);
			if (fvo == null) {
				boardvo.setFav(0);
			} else {
				boardvo.setFav(1);
			}

			// 로그인 한 사람의 참여 신청 여부 확인.
			ParticipateVo pvo = servPar.getOne(boardNum, memberId);
			if (pvo == null) {
				membervo.setParticipate(0); // 신청 안 함
			} else {
				if (pvo.getOk() == 1) { // 승인된 사람
					membervo.setParticipate(2); // 취소하고 싶음 해라~
				} else {
					membervo.setParticipate(1); // 신청 함
				}
			}

			// 댓글 리스트 화면에 보여줌
			CommentService comservice = new CommentService();
			ArrayList<CommentVo> list = comservice.getByboardNum(boardNum);
			boardvo.setReps(list);


			request.setAttribute("boardvo", boardvo); // 여기에 참여자 리스트가 담겨있어요~
			request.setAttribute("membervo", membervo);

			request.setAttribute("view", "/board/boardDetail.jsp");
			view = "/main.jsp";

		} else { // 참가 신청 버튼 눌렀을때 실행될 코드 적어야 함

			String memberId = request.getParameter("memberId");
			ParticipateVo pvo = servPar.getOne(boardNum, memberId);
			boolean flag = true;
			if (pvo == null) {
				servPar.Add(new ParticipateVo(memberId, boardNum, 0));
			} else {
				servPar.del(boardNum, memberId);
				flag = false;
			}

			JSONObject obj = new JSONObject();
			obj.put("flag", flag);
			String txt = obj.toJSONString();

			view = "responsebody/" + txt;

		}
		return view;
	}
}

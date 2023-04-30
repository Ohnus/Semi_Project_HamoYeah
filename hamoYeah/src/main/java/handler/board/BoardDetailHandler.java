package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		if (request.getMethod().equals("GET")) {

			// 이미지, 작성자 정보, 제목, 내용, 참여자 리스트, 참여신청버튼, 댓글창, 목록버튼, 즐겨찾기, 신고
			
			//게시글 가져오기
			BoardService boardService = new BoardService();
			BoardVo boardvo = boardService.getByBoardNum(boardNum);
			
			// 로그인 한 사람의 즐겨찾기 여부 확인.
			String memberId = (request.getParameter("memberId") == null) ? "" : request.getParameter("memberId");
			FavoritesVo fvo = servFav.getFavVo(boardvo.getBoardNum(), memberId);
			if (fvo == null) {
				boardvo.setFav(0);
			} else {
				boardvo.setFav(1);
			}
			
			//게시글 작성자 정보 가져오기
			HMemberService service1 = new HMemberService();
			HMemberVo membervo = service1.getHMember(boardvo.getMemberId());
			
			//댓글 리스트 화면에 보여줌
			CommentService comservice = new CommentService();
			ArrayList<CommentVo> list = comservice.getByboardNum(boardNum);
			boardvo.setReps(list);
			
			//참여자 리스트 화면에 보여줌
			ParticipateService parti = new ParticipateService();
			ArrayList<String> oklist = parti.getOk1(boardNum);
			ArrayList<HMemberVo> mvolist = new ArrayList<>();
			for(String id : oklist) {
				HMemberVo mvo = service1.getHMember(id);
				mvolist.add(mvo);
			}
			boardvo.setMvolist(mvolist);
			
			request.setAttribute("boardvo", boardvo);
			request.setAttribute("membervo", membervo);

			request.setAttribute("view", "/board/boardDetail.jsp");
			view = "/main.jsp";
			
		} else { //참가 신청 버튼 눌렀을때 실행될 코드 적어야 함

			String memberId = request.getParameter("memberId");

			servPar.Add(new ParticipateVo(memberId, boardNum, 0));

		}
		return view;
	}
}

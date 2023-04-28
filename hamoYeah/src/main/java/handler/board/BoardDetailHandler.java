package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import comment.CommentService;
import comment.CommentVo;
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
		int boardNum = Integer.parseInt(request.getParameter("boardNum")); //게시글 번호 빨리 받아와
		ParticipateService servPar = new ParticipateService();
		
		if (request.getMethod().equals("GET")) {
		
		//이미지, 작성자 정보, 제목, 내용, 참여자 리스트, 참여신청버튼, 댓글창, 목록버튼, 즐겨찾기, 신고		
		BoardService service = new BoardService();
		BoardVo boardvo = service.getByBoardNum(boardNum);
		HMemberService service1 = new HMemberService();
		HMemberVo membervo = service1.getHMember(boardvo.getMemberId());
		
		//참여자 리스트
		ArrayList<HMemberVo> mvolist = new ArrayList<>();
		ArrayList<String> oklist = servPar.getOk1(boardNum);
		for(String id:oklist) {
			HMemberVo mvo = service1.getHMember(id);	
			mvolist.add(mvo);
		}

		//댓글리스트 화면에 보여주는 코드
		CommentService comservice = new CommentService();
		ArrayList<CommentVo> list = comservice.getByboardNum(boardNum);
		boardvo.setReps(list);
		
		request.setAttribute("mvolist", mvolist);
		request.setAttribute("boardvo", boardvo);
		request.setAttribute("membervo", membervo);
		
		view = "/board/boardDetail.jsp";
		} else {
		String memberId = request.getParameter("memberId");
		servPar.Add(new ParticipateVo(memberId, boardNum, 0));
			
			
			
		}
		return view;
	}

}

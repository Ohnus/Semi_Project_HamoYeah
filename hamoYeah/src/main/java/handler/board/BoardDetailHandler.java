package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import member.HMemberService;
import member.HMemberVo;

public class BoardDetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int boardNum = Integer.parseInt(request.getParameter("boardNum")); //게시글 번호 빨리 받아와
		//이미지, 작성자 정보, 제목, 내용, 참여자 리스트, 참여신청버튼, 댓글창, 목록버튼, 즐겨찾기, 신고
		BoardService service = new BoardService();
		BoardVo boardvo = service.getByBoardNum(boardNum);
		HMemberService service1 = new HMemberService();
		HMemberVo membervo = service1.getHMember(boardvo.getMemberId());
		request.setAttribute("boardvo", boardvo);
		request.setAttribute("membervo", membervo);
		
		return "/board/boardDetail.jsp";
	}

}

package handler.review;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import likes.LikesService;
import member.HMemberService;
import member.HMemberVo;
import review.reviewService;
import review.reviewVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
//		String tag = request.getParameter("tag");
	
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		reviewService service = new reviewService();
		LikesService s = new LikesService();
		int cnt = s.getLikes(reviewNum);
		
		reviewVo vo = service.getByReviewNum(reviewNum);
		int boardNum = vo.getboardNum(); // 원글번호에 해당하는 리뷰글 골라오기 위해서 소환
		String memberId = vo.getmemberId(); // 리뷰 작성자 인포 따올려고 소환
		
		BoardService bservice = new BoardService();
		BoardVo bvo = bservice.getByBoardNum(boardNum);
		
		HMemberService mservice = new HMemberService();
		HMemberVo mvo = mservice.getHMember(memberId); // 리뷰작성한 아이디 불러와서 그 아이디에 해당하는 인포 불러와
		
		request.setAttribute("vo", vo); // 리뷰 1개 불러오기
		request.setAttribute("mvo", mvo); // 리뷰작성자 정보
		request.setAttribute("bvo", bvo); // 원글 정보
//		request.setAttribute("tag", tag);
		request.setAttribute("cnt", cnt);
		request.setAttribute("view", "/review/detail.jsp");
		return "/main.jsp";
		
	}
}

package participate;

import java.util.ArrayList;

public class ParticipateService {
	private ParticipateDao dao;

	public ParticipateService() {
		dao = new ParticipateDao();
	}

	// insert (참여하기 버튼 누름)
	public void Add(ParticipateVo vo) {
		dao.insert(vo);
	}

	// update (승인)
	public void editOk1(ParticipateVo vo) {
		dao.updateOk1(vo);
	}

	// update (거절) .. 승인한 사람 수가 peopleMax에 도달하면 이외의 사람들은 자동으로 거절됨.
	public void editOk2(ParticipateVo vo) {
		dao.updateOk2(vo);
	}

	// select (미승인)
	public ArrayList<String> getOk0(int boardNum) {
		return dao.selectOk0(boardNum);
	}

	// select (승인)
	public ArrayList<String> getOk1(int boardNum) {
		return dao.selectOk1(boardNum);
	}

	// select memberId -- 참여한 모임에 띄울 거.
	public ArrayList<ParticipateVo> getPvo(String memberId) {
		return dao.selectPvo(memberId);
	}
}

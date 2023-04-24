package participate;

public class ParticipateVo {
	private String memberId;
	private int boardNum;
	private int ok;
	
	public ParticipateVo() {}
	
	public ParticipateVo(String memberId, int boardNum, int ok) {
		super();
		this.memberId = memberId;
		this.boardNum = boardNum;
		this.ok = ok;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getOk() {
		return ok;
	}

	public void setOk(int ok) {
		this.ok = ok;
	}

	@Override
	public String toString() {
		return "ParticipateVo [memberId=" + memberId + ", boardNum=" + boardNum + ", ok=" + ok + "]";
	}
	
	
}

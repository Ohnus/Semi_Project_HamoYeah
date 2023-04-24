package favorites;

public class FavoritesVo {
	private String memberId;
	private int boardNum;
	private int delCnt;
	
	public FavoritesVo() {}

	public FavoritesVo(String memberId, int boardNum, int delCnt) {
		super();
		this.memberId = memberId;
		this.boardNum = boardNum;
		this.delCnt = delCnt;
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

	public int getDelCnt() {
		return delCnt;
	}

	public void setDelCnt(int delCnt) {
		this.delCnt = delCnt;
	}

	@Override
	public String toString() {
		return "FavoritesVo [memberId=" + memberId + ", boardNum=" + boardNum + ", delCnt=" + delCnt + "]";
	}
	
	
	
}

package favorites;

public class FavoritesVo {
	private String memberId;
	private int boardNum;
	
	public FavoritesVo() {}
	
	public FavoritesVo(String memberId, int boardNum) {
		super();
		this.memberId = memberId;
		this.boardNum = boardNum;
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

	@Override
	public String toString() {
		return "favoritesVo [memberId=" + memberId + ", boardNum=" + boardNum + "]";
	}
	
}

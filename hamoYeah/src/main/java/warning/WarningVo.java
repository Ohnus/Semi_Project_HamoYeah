package warning;

public class WarningVo {
	private String memberId;
	private int boardNum;
	private String content;
	
	public WarningVo() {
		
	}
	
	public WarningVo(String memberId, int boardNum, String content) {
		super();
		this.memberId = memberId;
		this.boardNum = boardNum;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "WarningVo [memberId=" + memberId + ", boardNum=" + boardNum + ", content=" + content + "]";
	}
	
}

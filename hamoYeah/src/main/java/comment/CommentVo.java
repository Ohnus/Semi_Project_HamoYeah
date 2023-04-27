package comment;

import java.util.ArrayList;

public class CommentVo {
	private String memberId;
	private int boardNum;
	private int repNum;
	private int reRepNum;
	private String content;
	private ArrayList<CommentVo> re_rep;
	
	public CommentVo() {
		
	}
	public CommentVo(String memberId, int boardNum, int repNum, int reRepNum, String content) {
		super();
		this.memberId = memberId;
		this.boardNum = boardNum;
		this.repNum = repNum;
		this.reRepNum = reRepNum;
		this.content = content;
	}
	public CommentVo(String memberId, int boardNum, String content, int reRepNum) {
		super();
		this.memberId = memberId;
		this.boardNum = boardNum;
		this.content = content;
	}
	
	public ArrayList<CommentVo> getRe_rep() {
		return re_rep;
	}
	public void setRe_rep(ArrayList<CommentVo> re_rep) {
		this.re_rep = re_rep;
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
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public int getReRepNum() {
		return reRepNum;
	}
	public void setReRepNum(int reRepNum) {
		this.reRepNum = reRepNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CommentVo [memberId=" + memberId + ", boardNum=" + boardNum + ", repNum=" + repNum + ", reRepNum="
				+ reRepNum + ", content=" + content + "]";
	}
		
}

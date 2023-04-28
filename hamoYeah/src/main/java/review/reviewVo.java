package review;

import java.sql.Date;

public class reviewVo {
	private String memberId;
	private int reviewNum;
	private int boardNum;
	private Date rDate;
	private int likes;
	private String imagepath;
	private String content;
	private String tag;

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public reviewVo() {};
	
	public reviewVo(String memberId, int reviewNum, int boardNum, Date rDate, int likes, String imagepath,
			String content) {
		super();
		this.memberId = memberId;
		this.reviewNum = reviewNum;
		this.boardNum = boardNum;
		this.rDate = rDate;
		this.likes = likes;
		this.imagepath = imagepath;
		this.content = content;
	}
	
	public reviewVo(String memberId, int reviewNum, int boardNum, Date rDate, int likes, String imagepath,
			String content, String tag) {
		super();
		this.memberId = memberId;
		this.reviewNum = reviewNum;
		this.boardNum = boardNum;
		this.rDate = rDate;
		this.likes = likes;
		this.imagepath = imagepath;
		this.content = content;
		this.tag = tag;
	}

	public String getmemberId() {
		return memberId;
	}
	public void setmemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getreviewNum() {
		return reviewNum;
	}
	public void setreviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getboardNum() {
		return boardNum;
	}
	public void setboardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "reviewVo [memberId=" + memberId + ", reviewNum=" + reviewNum + ", boardNum=" + boardNum
				+ ", rDate=" + rDate + ", likes=" + likes + ", imagepath=" + imagepath + ", content=" + content + "]";
	}
}
package review;

import java.sql.Date;

public class reviewVo {
	private String member_id;
	private int review_num;
	private int board_num;
	private Date r_date;
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
	
	public reviewVo(String member_id, int review_num, int board_num, Date r_date, int likes, String imagepath,
			String content) {
		super();
		this.member_id = member_id;
		this.review_num = review_num;
		this.board_num = board_num;
		this.r_date = r_date;
		this.likes = likes;
		this.imagepath = imagepath;
		this.content = content;
	}
	
	public reviewVo(String member_id, int review_num, int board_num, Date r_date, int likes, String imagepath,
			String content, String tag) {
		super();
		this.member_id = member_id;
		this.review_num = review_num;
		this.board_num = board_num;
		this.r_date = r_date;
		this.likes = likes;
		this.imagepath = imagepath;
		this.content = content;
		this.tag = tag;
	}

	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
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
		return "reviewVo [member_id=" + member_id + ", review_num=" + review_num + ", board_num=" + board_num
				+ ", r_date=" + r_date + ", likes=" + likes + ", imagepath=" + imagepath + ", content=" + content + "]";
	}
}
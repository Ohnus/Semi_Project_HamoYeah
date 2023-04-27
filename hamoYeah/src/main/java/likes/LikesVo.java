package likes;

public class LikesVo {

	
	
	private String member_id;
	private int review_num; 
	private int likes;
	
	
	public LikesVo() {};
	
	public LikesVo(String member_id, int review_num, int likes) {
		super();
		this.member_id = member_id;
		this.review_num = review_num;
		this.likes = likes;
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
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	@Override
	public String toString() {
		return "LikesVo [member_id=" + member_id + ", review_num=" + review_num + ", likes=" + likes + "]";
	}
	
}

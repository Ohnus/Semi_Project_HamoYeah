package board;

import java.sql.Date;
import java.util.ArrayList;

import comment.CommentVo;

public class BoardVo {
	private String memberId;
	private int boardNum;
	private Date wDate;
	private String title;
	private String content;
	private String imagepath;
	private String place;
	private String dDay;
	private String tag;
	private int peopleMax;
	private int y_card;
	private int process;
	private int ok;
	private ArrayList<CommentVo> reps; //수정

	public BoardVo() {
	}

	public BoardVo(String memberId, int boardNum, Date wDate, String title, String content, String imagepath,
			String place, String dDay, String tag, int peopleMax, int y_card, int process, int ok) {
		this.memberId = memberId;
		this.boardNum = boardNum;
		this.wDate = wDate;
		this.title = title;
		this.content = content;
		this.imagepath = imagepath;
		this.place = place;
		this.dDay = dDay;
		this.tag = tag;
		this.peopleMax = peopleMax;
		this.y_card = y_card;
		this.process = process;
		this.ok = ok;
	}

	public ArrayList<CommentVo> getReps() {
		return reps;
	}

	public void setReps(ArrayList<CommentVo> reps) {
		this.reps = reps;
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

	public Date getwDate() {
		return wDate;
	}

	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getdDay() {
		return dDay;
	}

	public void setdDay(String dDay) {
		this.dDay = dDay;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getPeopleMax() {
		return peopleMax;
	}

	public void setPeopleMax(int peopleMax) {
		this.peopleMax = peopleMax;
	}

	public int getY_card() {
		return y_card;
	}

	public void setY_card(int y_card) {
		this.y_card = y_card;
	}

	public int getProcess() {
		return process;
	}

	public void setProcess(int process) {
		this.process = process;
	}

	public int getOk() {
		return ok;
	}

	public void setOk(int ok) {
		this.ok = ok;
	}

	@Override
	public String toString() {
		return "BoardVo [memberId=" + memberId + ", boardNum=" + boardNum + ", wDate=" + wDate + ", title=" + title
				+ ", content=" + content + ", imagepath=" + imagepath + ", place=" + place + ", dDay=" + dDay + ", tag="
				+ tag + ", peopleMax=" + peopleMax + ", y_card=" + y_card + ", process=" + process + ", ok=" + ok
				+ ", reps=" + reps + "]";
	}

}

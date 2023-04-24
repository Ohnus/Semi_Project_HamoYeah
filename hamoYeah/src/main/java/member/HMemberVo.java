package member;

public class HMemberVo {
	private String memberId;
	private String pwd;
	private String name;
	private String phone;
	private String nickname;
	private String gender;
	private String age;
	private String intro;
	private String tag1;
	private String tag2;
	private String tag3;
	private String imagepath;
	
	public HMemberVo() {
	}
	
	public HMemberVo(String memberId, String pwd, String name, String phone, String nickname, String gender, String age,
			String intro, String tag1, String tag2, String tag3, String imagepath) {
		super();
		this.memberId = memberId;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.intro = intro;
		this.tag1 = tag1;
		this.tag2 = tag2;
		this.tag3 = tag3;
		this.imagepath = imagepath;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getTag1() {
		return tag1;
	}

	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}

	public String getTag2() {
		return tag2;
	}

	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}

	public String getTag3() {
		return tag3;
	}

	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	@Override
	public String toString() {
		return "HMemberVo [memberId=" + memberId + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", nickname="
				+ nickname + ", gender=" + gender + ", age=" + age + ", intro=" + intro + ", tag1=" + tag1 + ", tag2="
				+ tag2 + ", tag3=" + tag3 + ", imagepath=" + imagepath + "]";
	}
}
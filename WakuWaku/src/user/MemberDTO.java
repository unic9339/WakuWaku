package user;

public class MemberDTO {

	private int unum;
	private String id;
	private String passwd;
	private String uname;
	private String gender;
	private String phone;
	private int perm;
	private String email;
	private String birth;
	private String uregdate;
	
	public MemberDTO() {
		super();
		System.out.println("MemberDTO() 객체 생성");
	}

	public MemberDTO(String id, String passwd, String uname, String gender, String phone,
			String email, String birth) {
		super();
		System.out.println("MemberDTO(id, pw, name ...) 객체 생성");
		this.id = id;
		this.passwd = passwd;
		this.uname = uname;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPerm() {
		return perm;
	}

	public void setPerm(int perm) {
		this.perm = perm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getUregdate() {
		return uregdate;
	}

	public void setUregdate(String uregdate) {
		this.uregdate = uregdate;
	}



}

package first.member.model;

import java.sql.Date;

public class Member {
	
	private int uidx;
	private String uid; //사용자 이메일
	private String upw;
	private String uname;
	private String uphonenum;
	private String uphoto;
	private Date uregdate;
	
	public Member() {
	}

	public Member(int uidx, String uid, String upw, String uname, String uphonenum, String uphoto, Date uregdate) {
		this.uidx = uidx;
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.uphonenum = uphonenum;
		this.uphoto = uphoto;
		this.uregdate = uregdate;
	}
	
	//RegRequest -> Member
	public Member(String uid, String upw, String uname, String uphonenum) {
		this(0, uid, upw, uname, uphonenum, null, null);
	}

	public int getUidx() {
		return uidx;
	}

	public void setUidx(int uidx) {
		this.uidx = uidx;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUphonenum() {
		return uphonenum;
	}

	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}

	public String getUphoto() {
		return uphoto;
	}

	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}

	public Date getUregdate() {
		return uregdate;
	}

	public void setUregdate(Date uregdate) {
		this.uregdate = uregdate;
	}

	@Override
	public String toString() {
		return "Member [uidx=" + uidx + ", uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uphonenum="
				+ uphonenum + ", uphoto=" + uphoto + ", uregdate=" + uregdate + "]";
	}
	
}
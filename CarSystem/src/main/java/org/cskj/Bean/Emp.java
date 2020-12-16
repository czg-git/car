package org.cskj.Bean;

public class Emp {

	private int eid;
	
	private String ename;
	
	private String job;
	
	private String phone;

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Emp(int eid, String ename, String job, String phone) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.job = job;
		this.phone = phone;
	}

	public Emp() {
		super();
	}

	public Emp(int eid, String ename) {
		super();
		this.eid = eid;
		this.ename = ename;
	}

	public Emp(int eid) {
		super();
		this.eid = eid;
	}

	public Emp(String ename, String job, String phone) {
		super();
		this.ename = ename;
		this.job = job;
		this.phone = phone;
	}

	public Emp(String ename) {
		super();
		this.ename = ename;
	}


	@Override
	public String toString() {
		return "Emp [eid=" + eid + ", ename=" + ename + ", job=" + job + ", phone=" + phone + "]";
	}
	
}

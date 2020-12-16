package org.cskj.Bean;

public class Parts {
private int pid;
private String pname;
private Double inprice;
private Double outprice;
private String dealers;
private String phone;
private String indate;
private int num;
private String note;
private Emp emp;
private String type;
private int eid;

public Parts(int pid, String pname, Double inprice, Double outprice, String dealers, String phone, String indate, int num,
		String note, Emp emp,String type) {
	super();
	this.pid = pid;
	this.pname = pname;
	this.inprice = inprice;
	this.outprice = outprice;
	this.dealers = dealers;
	this.phone = phone;
	this.indate = indate;
	this.num = num;
	this.note = note;
	this.emp = emp;
	this.type = type;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public Double getInprice() {
	return inprice;
}
public void setInprice(Double inprice) {
	this.inprice = inprice;
}
public Double getOutprice() {
	return outprice;
}
public void setOutprice(Double outprice) {
	this.outprice = outprice;
}
public String getDealers() {
	return dealers;
}
public void setDealers(String dealers) {
	this.dealers = dealers;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getIndate() {
	return indate;
}
public void setIndate(String indate) {
	this.indate = indate;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}
public Emp getEmp() {
	return emp;
}
public void setEmp(Emp emp) {
	this.emp = emp;
}
public Parts() {
	super();
}
public Parts(int pid) {
	super();
	this.pid = pid;
}
public Parts(int pid, String pname) {
	super();
	this.pid = pid;
	this.pname = pname;
}

public int getEid() {
	return eid;
}

public void setEid(int eid) {
	this.eid = eid;
}

public Parts(String pname, Double inprice, Double outprice, String dealers, String phone, String indate, int num) {
	super();
	this.pname = pname;
	this.inprice = inprice;
	this.outprice = outprice;
	this.dealers = dealers;
	this.phone = phone;
	this.indate = indate;
	this.num = num;
}
@Override
public String toString() {
	return "Parts [pid=" + pid + ", pname=" + pname + ", inprice=" + inprice + ", outprice=" + outprice + ", dealers="
			+ dealers + ", phone=" + phone + ", indate=" + indate + ", num=" + num + ", note=" + note + ", emp=" + emp
			+ "]";
}

}

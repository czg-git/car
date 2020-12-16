package org.cskj.Bean;

public class Car {
	private int id;
	private String imageUrl;
	private String carbrand;
	private String type;
	private String card;
	private int km;
	private String note;
	private int timemoney;
	private int partmoney;
	private int allmoney;
	private String date;
	private String name;
	private String phone;
	private int paystatus;
	private Parts parts;
	private String startdate;
	private String enddate;
	private int pid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getCarbrand() {
		return carbrand;
	}
	public void setCarbrand(String carbrand) {
		this.carbrand = carbrand;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getTimemoney() {
		return timemoney;
	}
	public void setTimemoney(int timemoney) {
		this.timemoney = timemoney;
	}
	public int getPartmoney() {
		return partmoney;
	}
	public void setPartmoney(int partmoney) {
		this.partmoney = partmoney;
	}
	public int getAllmoney() {
		return allmoney;
	}
	public void setAllmoney(int allmoney) {
		this.allmoney = allmoney;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public int getPaystatus() {
		return paystatus;
	}
	public void setPaystatus(int paystatus) {
		this.paystatus = paystatus;
	}
	public Parts getParts() {
		return parts;
	}
	public void setParts(Parts parts) {
		this.parts = parts;
	}
	
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Car(int id, String imageUrl, String carbrand, String type, String card, int km, String note, int timemoney,
			int partmoney, int allmoney, String date, String name, String phone, int paystatus, Parts parts,
			String startdate, String enddate) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.carbrand = carbrand;
		this.type = type;
		this.card = card;
		this.km = km;
		this.note = note;
		this.timemoney = timemoney;
		this.partmoney = partmoney;
		this.allmoney = allmoney;
		this.date = date;
		this.name = name;
		this.phone = phone;
		this.paystatus = paystatus;
		this.parts = parts;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public Car() {
		super();
	}
	
	public Car(String carbrand, String type, String card, String name, String phone, int paystatus,String startdate, String enddate) {
		super();
		this.carbrand = carbrand;
		this.type = type;
		this.card = card;
		this.name = name;
		this.phone = phone;
		this.paystatus = paystatus;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "Car [id=" + id + ", imageUrl=" + imageUrl + ", carbrand=" + carbrand + ", type=" + type + ", card="
				+ card + ", km=" + km + ", note=" + note + ", timemoney=" + timemoney + ", partmoney=" + partmoney
				+ ", allmoney=" + allmoney + ", date=" + date + ", name=" + name + ", phone=" + phone + ", paystatus="
				+ paystatus + ", parts=" + parts + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
	
	
	
}

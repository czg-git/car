package org.cskj.Bean;

public class Menu {

	private int id;
	private String name;
	private int pid;
	private String url;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Menu(int id, String name, int pid, String url) {
		super();
		this.id = id;
		this.name = name;
		this.pid = pid;
		this.url = url;
	}
	public Menu() {
		super();
	}
	
}

package org.cskj.Bean;

public class salaryVo {

	private String name;
	private int value;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public salaryVo(String name, int value) {
		super();
		this.name = name;
		this.value = value;
	}
	public salaryVo() {
		super();
	}
	@Override
	public String toString() {
		return "{value:" + value + ", name:'" + name + "'}";
	}
	
}

package org.cskj.Bean;

public class PartVo {
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
public PartVo(String name, int value) {
	super();
	this.name = name;
	this.value = value;
}
public PartVo() {
	super();
}
@Override
public String toString() {
	return "PartVo [name=" + name + ", value=" + value + "]";
}

}

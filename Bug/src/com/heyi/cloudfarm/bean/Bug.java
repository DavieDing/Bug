package com.heyi.cloudfarm.bean;

public class Bug {

	private String id;															//bug id
	private String oper;														//operation step for this bug
	private String descp;														//description of this bug
	private boolean fixed;												//bug fixed?
	private String grade;													//the seriousness of this bug

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}
	public String getDesc() {
		return descp;
	}
	public void setDesc(String desc) {
		this.descp = desc;
	}
	public boolean isFixed() {
		return fixed;
	}
	public void setFixed(boolean fixed) {
		this.fixed = fixed;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}

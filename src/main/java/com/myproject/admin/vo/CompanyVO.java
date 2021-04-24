package com.myproject.admin.vo;

public class CompanyVO {
	private int idx;
	private String companyNm;
	private String companyX;
	private String companyY;
	private String companyAddr1;
	private String companyCEO;
	public String getCompanyNm() {
		return companyNm;
	}
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}
	public String getCompanyX() {
		return companyX;
	}
	public void setCompanyX(String companyX) {
		this.companyX = companyX;
	}
	public String getCompanyY() {
		return companyY;
	}
	public void setCompanyY(String companyY) {
		this.companyY = companyY;
	}
	public String getCompanyAddr1() {
		return companyAddr1;
	}
	public void setCompanyAddr1(String companyAddr1) {
		this.companyAddr1 = companyAddr1;
	}
	public String getCompanyCEO() {
		return companyCEO;
	}
	public void setCompanyCEO(String companyCEO) {
		this.companyCEO = companyCEO;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	@Override
	public String toString() {
		return "CompanyVO [idx=" + idx + ", companyNm=" + companyNm + ", companyX=" + companyX + ", companyY="
				+ companyY + ", companyAddr1=" + companyAddr1 + ", companyCEO=" + companyCEO + "]";
	}
	
}

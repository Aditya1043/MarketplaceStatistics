package com.example.model;

public class CompanyData {
	private String company;
	private Long BDM;
	private Long EDC;
	private Long IICS;
	private Long PowerCenter;
	public CompanyData(Long bDM, Long eDC, Long iICS, Long powerCenter) {
		super();
		BDM = bDM;
		EDC = eDC;
		IICS = iICS;
		PowerCenter = powerCenter;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Long getBDM() {
		return BDM;
	}
	public void setBDM(Long bDM) {
		BDM = bDM;
	}
	public Long getEDC() {
		return EDC;
	}
	public void setEDC(Long eDC) {
		EDC = eDC;
	}
	public Long getIICS() {
		return IICS;
	}
	public void setIICS(Long iICS) {
		IICS = iICS;
	}
	public Long getPowerCenter() {
		return PowerCenter;
	}
	public void setPowerCenter(Long powerCenter) {
		PowerCenter = powerCenter;
	}
}

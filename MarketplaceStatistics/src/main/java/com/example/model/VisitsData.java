package com.example.model;

public class VisitsData {
	private String company;
	private Long BDM;
	private Long DEI;
	private Long DEQ;
	private Long DES;
	private Long DQ;
	private Long EDC;
	private Long EDP;
	private Long IICS;
	private Long PowerCenter;
	
	public VisitsData(Long bDM, Long dEI, Long dEQ, Long dES, Long dQ, Long eDC, Long eDP, Long iICS,
			Long powerCenter) {
		BDM = bDM;
		DEI = dEI;
		DEQ = dEQ;
		DES = dES;
		DQ = dQ;
		EDC = eDC;
		EDP = eDP;
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
	public Long getDEI() {
		return DEI;
	}
	public void setDEI(Long dEI) {
		DEI = dEI;
	}
	public Long getDEQ() {
		return DEQ;
	}
	public void setDEQ(Long dEQ) {
		DEQ = dEQ;
	}
	public Long getDES() {
		return DES;
	}
	public void setDES(Long dES) {
		DES = dES;
	}
	public Long getDQ() {
		return DQ;
	}
	public void setDQ(Long dQ) {
		DQ = dQ;
	}
	public Long getEDC() {
		return EDC;
	}
	public void setEDC(Long eDC) {
		EDC = eDC;
	}
	public Long getEDP() {
		return EDP;
	}
	public void setEDP(Long eDP) {
		EDP = eDP;
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

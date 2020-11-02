package com.example.model;

public class TrendsData {
	private String usingDate;
	private Long newCustomers;
	private Long churnedCustomers;
	private Long activeCustomers;
	public TrendsData(Long newCustomers, Long churnedCustomers, Long activeCustomers) {
		this.newCustomers = newCustomers;
		this.churnedCustomers = churnedCustomers;
		this.activeCustomers = activeCustomers;
	}
	public String getUsingDate() {
		return usingDate;
	}
	public void setUsingDate(String usingDate) {
		this.usingDate = usingDate;
	}
	public Long getNewCustomers() {
		return newCustomers;
	}
	public void setNewCustomers(Long newCustomers) {
		this.newCustomers = newCustomers;
	}
	public Long getChurnedCustomers() {
		return churnedCustomers;
	}
	public void setChurnedCustomers(Long churnedCustomers) {
		this.churnedCustomers = churnedCustomers;
	}
	public Long getActiveCustomers() {
		return activeCustomers;
	}
	public void setActiveCustomers(Long activeCustomers) {
		this.activeCustomers = activeCustomers;
	}
}

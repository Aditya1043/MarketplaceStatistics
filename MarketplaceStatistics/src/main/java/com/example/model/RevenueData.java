package com.example.model;

public class RevenueData {
	private Double revenue;
	private String product;
	public Double getRevenue() {
		return revenue;
	}
	public void setRevenue(Double revenue) {
		this.revenue = revenue;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "RevenueData [revenue=" + revenue + ", product=" + product + "]";
	}
}

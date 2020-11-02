package com.example.model;

public class CountSubscribers {
	private Long countSub;
	private String product;
	public Long getCountSub() {
		return countSub;
	}
	public void setCountSub(Long countSub) {
		this.countSub = countSub;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "CountSubscribers [countSub=" + countSub + ", product=" + product + "]";
	}
}

package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.service.CustomerService;

@SpringBootApplication
public class MarketplaceStatisticsApplication implements CommandLineRunner{
	@Autowired
	private CustomerService cs;
	
	// run at startup for saving data to DB from the excel sheets
	@Override
	public void run(String... args) throws Exception {
		cs.saveFirst();
		cs.saveSecond();
		cs.saveFirstPart();
		cs.saveAzureFirst();
		cs.saveAzureSecond();
		cs.saveAzureThird();
	}

	public static void main(String[] args) {
		SpringApplication.run(MarketplaceStatisticsApplication.class, args);
	}

}

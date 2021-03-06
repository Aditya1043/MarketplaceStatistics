package com.example;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.example.scheduled.ScheduledTasks;
import com.example.service.CustomerService;

@SpringBootApplication
@EnableScheduling
public class MarketplaceStatisticsApplication extends SpringBootServletInitializer implements CommandLineRunner{
	@Autowired
	private CustomerService cs;
	//@Autowired
	//private ScheduledTasks st;
	
	// run at startup for saving data to DB from the excel sheets
	@Override
	public void run(String... args) throws Exception {
		//st.scheduleTaskWithFixedRate();
		//cs.saveFirst();
		//cs.saveFirstPart();
		//cs.saveSecond();	
		cs.saveAzureFirst();
		cs.saveAzureSecond();
		cs.saveAzureThird();
	}

	public static void main(String[] args) {
		SpringApplication.run(MarketplaceStatisticsApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(MarketplaceStatisticsApplication.class);
	}
}

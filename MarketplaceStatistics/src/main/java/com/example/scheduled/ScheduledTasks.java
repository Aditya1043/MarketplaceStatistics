package com.example.scheduled;

import java.io.IOException;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.service.CustomerService;

@Component
public class ScheduledTasks {
	
	@Autowired
	private CustomerService cs;
	
	@Scheduled(cron = "0 0 15 * * ?")
	//@Scheduled(fixedDelay=1000)
	public void scheduleTaskWithFixedRate() throws IOException, ParseException, InterruptedException {
		InstanceHourly.update_data("daily_business_usage_by_instance_type" ,1 );
		cs.saveFirst();
		cs.saveFirstPart();
		CustomerHourly.update_data("customer_subscriber_hourly_monthly_subscriptions");
		cs.saveSecond();
	}

}

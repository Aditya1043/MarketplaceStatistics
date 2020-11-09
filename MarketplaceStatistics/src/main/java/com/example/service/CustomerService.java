package com.example.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AzureFirstDAO;
import com.example.dao.AzureSecondDAO;
import com.example.dao.AzureThirdDAO;
import com.example.dao.FirstDAO;
import com.example.dao.FirstPartDAO;
import com.example.dao.SecondDAO;
import com.example.model.AzureFirst;
import com.example.model.AzureSecond;
import com.example.model.AzureThird;
import com.example.model.CompanyData;
import com.example.model.CountSubscribers;
import com.example.model.First;
import com.example.model.FirstPart;
import com.example.model.Second;
import com.example.model.TrendsData;
import com.example.model.VisitsData;
import com.google.gson.Gson;

@Service
public class CustomerService {

	@Autowired
	private FirstDAO fdto;
	@Autowired
	private FirstPartDAO fpdto;
	@Autowired
	private SecondDAO sdto;
	@Autowired
	private AzureFirstDAO afdto;
	@Autowired
	private AzureSecondDAO asdto;
	@Autowired
	private AzureThirdDAO atdto;
	
	// function to parse the daily usage excel sheet, process the data and store it in h2 DB
	public void saveFirst() {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Map<String,String> map=new HashMap<String,String>();     
		map.put("Informatica Big Data Management", "BDM");
		map.put("Informatica Data Management as a Service for Amazon Web Services", "BDM");
		map.put("Informatica Enterprise Data Catalog", "EDC");
		map.put("Informatica Enterprise Data Catalog - Bastion", "EDC");
		map.put("Informatica Enterprise Data Catalog - Rhel", "EDC");
		map.put("Informatica Hadoop-Cluster Image for EDC", "EDC");
		map.put("Informatica Intelligent Cloud Services ETL for Amazon PAYG", "IICS");
		map.put("Informatica PowerCenter For Red Hat Linux (BYOL)", "PowerCenter");
		map.put("Informatica PowerCenter For Red Hat Linux (PAYG)", "PowerCenter");
		map.put("Informatica Remote Access Jump Server", "BDM");
		map.put("Informatica Data Engineering Integration - Rhel", "DEI");
		map.put("Informatica Data Quality For Red Hat Linux (BYOL)", "DQ");
		map.put("Informatica PowerCenter For Windows (PAYG)", "PowerCenter");
		
		try {
			String d = "12-10-2020";
			Calendar cal = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -1);
			String yesteday = dateFormat.format(cal.getTime());
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/aws/daily_business_usage_by_instance_type_" + yesteday + ".csv"));
		    CSVParser csvParser = new CSVParser(br,
		    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
		    List<First> first = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	    	    First f=new First();
				f.setCompany(csvRecord.get("Customer Email Domain"));
				f.setCustomer(csvRecord.get("Customer Reference ID"));
				f.setProduct(map.get(csvRecord.get("Product Title")));			
				f.setUsage(Integer.valueOf(csvRecord.get("Usage Units")));
				f.setInstance(csvRecord.get("Instance Type"));
				f.setRevenue(Double.valueOf(csvRecord.get("Estimated Revenue")));
				f.setDate(format.parse(d));
				first.add(f);
	        }
	        fdto.saveAll(first);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}

	// created the separate schema for countries for purpose of normalization
	public void saveFirstPart() {
		Map<String,String> map=new HashMap<String,String>();    
		try {
			Calendar cal = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -1);
			String yesteday = dateFormat.format(cal.getTime());
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/aws/daily_business_usage_by_instance_type_" + yesteday + ".csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<FirstPart> firstpart = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	    	    FirstPart fp=new FirstPart();
				fp.setCountry(csvRecord.get("Customer Country"));
				fp.setCompany(csvRecord.get("Customer Email Domain"));
				if(!map.containsKey(csvRecord.get("Customer Email Domain")))
				{
					firstpart.add(fp);
					map.put(csvRecord.get("Customer Email Domain"), csvRecord.get("Customer Country"));
				}	
	        }
	        fpdto.saveAll(firstpart);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// function to parse the customer_subscriber excel sheet, process the data and store it in h2 DB
	public void saveSecond() {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,String> map=new HashMap<String,String>();
		map.put("Informatica Big Data Management", "BDM");
		map.put("Informatica Big Data Management (BYOL)", "BDM");
		map.put("Informatica Big Data Quality", "DQ");
		map.put("Informatica Big Data Streaming", "BDS");
		map.put("Informatica Data Engineering Integration - Bastion", "DEI");
		map.put("Informatica Data Engineering Integration - Rhel", "DEI");
		map.put("Informatica Data Engineering Quality - Bastion", "DQ");
		map.put("Informatica Data Engineering Quality - Rhel", "DQ");
		map.put("Informatica Data Management as a Service for Amazon Web Services",	"BDM");
		map.put("Informatica Data Quality For RHEL (BYOL)", "DQ");
		map.put("Informatica Data Quality For Windows (BYOL)", "DQ");
		map.put("Informatica Enterprise Data Catalog", "EDC");
		map.put("Informatica Enterprise Data Catalog - Bastion", "EDC");
		map.put("Informatica Enterprise Data Catalog - Rhel", "EDC");
		map.put("Informatica Enterprise Data Preparation - Rhel", "EDP");
		map.put("Informatica Enterprise Data Preparation -Bastion", "EDP");
		map.put("Informatica Hadoop-Cluster Image for EDC", "EDC");
		map.put("Informatica Intelligent Cloud Services ETL for Amazon PAYG", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Aurora (Linux)",	"IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Aurora (Windows)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon RDS (Linux)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon RDS (Windows)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Redshift (Linux)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Redshift (Windows)",	"IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon S3 (Linux)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon S3 (Windows)", "IICS");
		map.put("Informatica Intelligent Cloud Services Secure Agent Windows (BYOL)", "IICS");
		map.put("Informatica PowerCenter For Red Hat Linux (BYOL)", "PowerCenter");
		map.put("Informatica PowerCenter For Red Hat Linux (PAYG)", "PowerCenter");
		map.put("Informatica PowerCenter For Windows (BYOL)", "PowerCenter");
		map.put("Informatica PowerCenter For Windows (PAYG)", "PowerCenter");
		map.put("Informatica Remote Access Jump Server", "BDM");
		map.put("RulePoint", "RulePoint");
		map.put("Vibe Data Stream for Machine Data", "VDS");
		map.put("Informatica Axon Data Governance 7.0 - Bastion", "AXON");
		map.put("Informatica Axon Data Governance 7.0 - RHEL", "AXON");
		map.put("Informatica Data Engineering Streaming - Bastion", "DES");
		map.put("Informatica Data Engineering Streaming - Rhel", "DES");
		map.put("Informatica Data Quality For Red Hat Linux (BYOL)", "DQ");
		map.put("Informatica Data Privacy Management 1041 - Bastion", "DP");
		map.put("Informatica Data Privacy Management 1041 - RHEL", "DP");
		
		try {
			Calendar cal = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -1);
			String yesteday = dateFormat.format(cal.getTime());
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/aws/customer_subscriber_hourly_monthly_subscriptions_" + yesteday + ".csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<Second> second = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	    	    Second s=new Second();
				s.setCustomer(csvRecord.get("Customer AWS Account Number"));
				s.setProduct(map.get(csvRecord.get("Product Title")));
				Date date = format.parse(csvRecord.get("Subscription Start Date"));
				s.setStartDate(date);
				second.add(s);	
	        }
	        sdto.saveAll(second);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void saveAzureFirst() {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Map<String,String> m=new HashMap<String,String>();
		m.put("BDM VM IMAGE 10.2", "BDM");
		m.put("BDM VM IMAGE 10.2.1", "BDM");
		m.put("Big Data Management 10.1.1-UPDATE2 VM Image", "BDM");
		m.put("Big Data Management 10.2 BYOL", "BDM");
		m.put("DB VM IMAGE 10.2.2",	"DB");
		m.put("EDC 10.2.2 HF1 DB VM ONLY", "EDC");
		m.put("EDC VM IMAGE 10.2", "EDC");
		m.put("EDC VM IMAGE 10.2.2", "EDC");
		m.put("EDC VM IMAGE 10.2.2 HF1", "EDC");
		m.put("ICS PAYG Windows", "ICS");
		m.put("IDQ 10.1.1 HF2 VM Image Windows Server", "DQ");
		m.put("IHS VM IMAGE 10.2.2", "IHS");
		m.put("IICS RHEL LINUX BYOL", "IICS");
		m.put("IICS WINDOWS BYOL", "IICS");
		m.put("Informatica AXON 7", "AXON");
		m.put("Informatica Data Accelerator for Azure - Win_BYOL", "IDA");
		m.put("Informatica Data Accelerator for Azure_Ubuntu_BYOL", "IDA");
		m.put("Informatica database", "DB");
		m.put("Informatica Database 1041", "DB");
		m.put("Informatica Intelligent Cloud Services Ubuntu-BYOL", "IICS");
		m.put("Informatica Intelligent Cloud Services Win-BYOL", "IICS");
		m.put("Informatica Server", "Server");
		m.put("Informatica Server 1041", "Server");
		m.put("Informatica Server for Windows",	"Server");
		m.put("Informatica Windows 1041", "Windows");
		m.put("PC 10.2 HF1 Domain VM Image RHEL", "PowerCenter");
		m.put("PC 10.2 HF2 Domain VM Image RHEL", "PowerCenter");
		m.put("PC 10.2 HF2 Domain VM Image WINDOWS", "PowerCenter");
		m.put("SqlServer 2014 Image for PC & BDM solutions", "Server");
		m.put("Australia", "AU");
		m.put("Brazil",	"BR");
		m.put("Bulgaria", "BG");
		m.put("Canada",	"CA");
		m.put("Finland", "FI");
		m.put("France",	"FR");
		m.put("Germany", "DE");
		m.put("India", "IN");
		m.put("Italy", "IT");
		m.put("Netherlands", "NL");
		m.put("Norway", "NO");
		m.put("Pakistan", "PK");
		m.put("Peru", "PE");
		m.put("Qatar", "QA");
		m.put("Romania", "RO");
		m.put("Singapore", "SG");
		m.put("Slovakia", "SK");
		m.put("South Africa", "ZA");
		m.put("Sweden",	"SE");
		m.put("Switzerland", "CH");
		m.put("Taiwan", "SY");
		m.put("Thailand", "TH");
		m.put("United Kingdom",	"GB");
		m.put("United States", "US");


		try {
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/Usage_Apr2020-Oct2020_20201006121913___10062020_0649hrs__fbc0345c-817e-4380-9caa-9d38924d3cfd.csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<AzureFirst> azurefirst = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	        	AzureFirst af=new AzureFirst();
	        	af.setSubId(csvRecord.get("Marketplace Subscription Id"));
	        	Date sd = format.parse(csvRecord.get("MonthStartDate"));
	        	af.setStartDate(sd);
	        	af.setSku(m.get(csvRecord.get("SKU")));
	        	af.setCountry(m.get(csvRecord.get("Customer Country")));
	        	Date ud = format.parse(csvRecord.get("Usage Date"));
	        	af.setUsageDate(ud);
	        	af.setUsage(Double.valueOf(csvRecord.get("NormalizedUsage")));
	        	azurefirst.add(af);
	        }
	        afdto.saveAll(azurefirst);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void saveAzureSecond() {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		try {
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/Customer_Apr2020-Oct2020_20201006121944___10062020_0649hrs__c10f1c12-2a14-49e8-94df-e6cc668b555d.csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<AzureSecond> azuresecond = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	        	AzureSecond as=new AzureSecond();
	        	as.setSubId(csvRecord.get("Marketplace Subscription Id"));
	        	Date ad = format.parse(csvRecord.get("DateAcquired"));
	        	as.setAcquiredDate(ad);
	        	if(csvRecord.get("DateLost")=="") {
	        		as.setLostDate(null);
	        	} else {
	        		Date ld = format.parse(csvRecord.get("DateLost"));
	        		as.setLostDate(ld);
	        	}
	        	azuresecond.add(as);
	        }
	        asdto.saveAll(azuresecond);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void saveAzureThird() {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,String> m=new HashMap<String,String>();
		m.put("annualiics", "IICS");
		m.put("big-data-management-10-2-2-byol", "BDM");
		m.put("big-data-management-byol", "BDM");
		m.put("enterprise_data_catalog_10_2_2", "EDC");
		m.put("enterprisedatacatalog_10_2_2_hf1", "EDC");
		m.put("iics-winter", "IICS");
		m.put("informaica-dei-1040", "DEI");
		m.put("informaica-deq-1040", "DEQ");
		m.put("informaica-deq-1041", "DEQ");
		m.put("informaica-des-1040", "DES");
		m.put("informaica-des-1041", "DES");
		m.put("informaica-edc-1041", "EDC");
		m.put("informaica-edp-1041", "EDP");
		m.put("informatica-data-quality", "DQ");
		m.put("informatica-dei-1041", "DEI");
		m.put("informaticaedc1040",	"EDC");
		m.put("informaticaedp1040",	"EDP");
		m.put("informatica-idq-1040", "DQ");
		m.put("informatica-idq-1041", "DQ");
		m.put("powercenter", "PowerCenter");
		m.put("powercenter-1040", "PowerCenter");
		m.put("powercenter-1041", "PowerCenter");
		
		try {
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/Azure Marketplace___10062020_0706hrs__8ceb5fdd-5038-414a-8dfa-9484cefa5fbe.csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<AzureThird> azurethird = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	        	AzureThird at=new AzureThird();
	        	Date d = format.parse(csvRecord.get("Date"));
	        	at.setDate(d);
	        	at.setSku(m.get(csvRecord.get("Offer Name")));
	        	if(csvRecord.get("Country Name")=="") {
	        		at.setCountry("Other");
	        	} else {
	        		at.setCountry(csvRecord.get("Country Name"));
	        	}
	        	at.setVisits(Integer.valueOf(csvRecord.get("Page Visits")));
	        	azurethird.add(at);
	        }
	        atdto.saveAll(azurethird);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	// fetching the data from the DB for Subscribers per product chart, converting it to json format and return
	public String NumberOfSubscribers(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=sdto.findAllCustomersPerProduct(dd, dd1);
		}
		else {
			list=sdto.findCustomersPerProduct(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	// fetching data from DB for hours per product chart 
	public String UsagePerProduct(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllUsagePerProduct(dd, dd1);
		}
		else {
			list=fdto.findUsagePerProduct(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	//fetching data from DB for Deployment Hours / Customers graph
	public String CompanyData(String startDate, String endDate, String product) throws ParseException {
		Map<String,Map<String,Long>> m=new HashMap<>();
		List<CompanyData> l = new ArrayList<>();
		
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllCompanyDetails(dd, dd1);
		} else {
			list=fdto.findCompanyDetails(dd, dd1, product);
		}
		list.forEach(data->{
			String c = (String)data[0];
			String p = (String)data[1];
			Long u = (Long)data[2];
			if (!m.containsKey(c)) {
	            m.put(c, new HashMap<String,Long>());
	        }
	        m.get(c).put(p, u);
		});
		
		for (Map.Entry<String,Map<String,Long>> entry : m.entrySet())  {
			CompanyData cd=new CompanyData(new Long(0),new Long(0),new Long(0),new Long(0));
			cd.setCompany(entry.getKey());
			
            for(Map.Entry<String,Long> e : entry.getValue().entrySet()) {
            	switch(e.getKey()) {
	 			   case "BDM" :
	 				  cd.setBDM(e.getValue());
	 			      break;
	 			   case "EDC" :
	 				   cd.setEDC(e.getValue());
		 		      break;
	 			   case "IICS" :
	 				   cd.setIICS(e.getValue());
	 				  break;
	 			   case "PowerCenter" :
	 				   cd.setPowerCenter(e.getValue());
	 				  break;	      
	 			   default :
	 				   
	 			}
            }
            l.add(cd);
		}
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	//fetching total number of subscribers from DB
	public int countSubscribers(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		int i;
		if(product.equals("All")) {
			i=(Integer)sdto.findAllcountSubscribers(dd, dd1);
		} else {
			i=(Integer)sdto.findcountSubscribers(dd, dd1, product);
		}
		return i;
	}
		
	// fetching total number of hours from DB
	public int countHours(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		int i;
		if(product.equals("All")) {
			i=(Integer)fdto.findAllcountHours(dd, dd1);
		} else {
			i=(Integer)fdto.findcountHours(dd, dd1, product);
		}
		return i;
	}
	
	//fetching data from DB for monthly new subscribers 
	public String customerDetailsByDate(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list = sdto.findAllSubscribersByDate(dd, dd1);
		} else {
			list = sdto.findSubscribersByDate(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			Integer m=(int)data[1];
			Integer y=(int)data[2];
			cs.setProduct(y.toString()+"-"+m.toString());
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	// fetching data from DB for Usage Units / Country graph
	public String countryDetails(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllCountryDetails(dd, dd1);
		}
		else {
			list=fdto.findCountryDetails(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
/*	public String usagepercountry(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllUsagePerCountry(dd, dd1);
		} else {
			list=fdto.findUsagePerCountry(dd, dd1, product);
		}
		
		Gson json=new Gson();
		String res=json.toJson(list);
		return res;
	}
	
	public String revenueperproduct(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<RevenueData> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list=fdto.findRevenuePerProduct(dd, dd1, product);
		list.forEach(data->{
			RevenueData rd=new RevenueData();
			rd.setRevenue((Double)data[0]);
			rd.setProduct((String)data[1]);
			l.add(rd);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	public String instanceperproduct(String startDate, String endDate, String product) throws ParseException {
		Map<String,Map<String,Long>> m=new HashMap<>();
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list=fdto.findInstanceDetails(dd, dd1, product);
		list.forEach(data->{
			String p = (String)data[0];
			String i = (String)data[1];
			Long c = (Long)data[2];
			if(m.containsKey(p)) {
				
			} else {
				
			}
		});
		
		Gson json=new Gson();
		String res=json.toJson(list);
		return res;
	}*/
	
	//azure
	
	public String azurecustomerDetailsByDate(String startDate, String endDate) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list = asdto.findAllSubscribersByDate(dd, dd1);
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			Integer m=(int)data[1];
			Integer y=(int)data[2];
			cs.setProduct(y.toString()+"-"+m.toString());
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	public int azurecountSubscribers(String startDate, String endDate) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		int i = (Integer)asdto.findAllcountSubscribers(dd, dd1);
		return i;
	}
	
	public int azurecountHours(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		int i;
		if(product.equals("All")) {
			i=(Integer)afdto.findAllcountHours(dd, dd1);
		} else {
			i=(Integer)afdto.findcountHours(dd, dd1, product);
		}
		return i;
	}
	
	public String azureUsagePerProduct(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=afdto.findAllUsagePerProduct(dd, dd1);
		}
		else {
			list=afdto.findUsagePerProduct(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub(Math.round((Double)data[0]));
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	public String azurecountryDetails(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=afdto.findAllUsagePerCountry(dd, dd1);
		}
		else {
			list=afdto.findUsagePerCountry(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub(Math.round((Double)data[0]));
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	public String azureVisitsDetailsStacked(String startDate, String endDate, String product) throws ParseException {
		Map<String,Map<String,Long>> m=new HashMap<>();
		List<VisitsData> l=new ArrayList<>();
		
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=atdto.findAllVisitsDetails(dd, dd1);
		} else {
			list=atdto.findVisitsDetails(dd, dd1, product);
		}
		
		list.forEach(data->{
			String p = (String)data[0];
			String c = (String)data[1];
			Long v = (Long)data[2];
			if (!m.containsKey(c)) {
	            m.put(c, new HashMap<String,Long>());
	        }
	        m.get(c).put(p, v);
		});
		
		for (Map.Entry<String,Map<String,Long>> entry : m.entrySet())  {
			VisitsData vd=new VisitsData(new Long(0),new Long(0),new Long(0),new Long(0),new Long(0),new Long(0),new Long(0),new Long(0),new Long(0));
			vd.setCompany(entry.getKey());
			
            for(Map.Entry<String,Long> e : entry.getValue().entrySet()) {
            	switch(e.getKey()) {
	 			   case "BDM" :
	 				  vd.setBDM(e.getValue());
	 			      break;
	 			   case "DEI" :
	 				  vd.setDEI(e.getValue());
		 			  break;
	 			   case "DEQ" :
	 				   vd.setDEQ(e.getValue());
		 			  break;
	 			   case "DES" :
	 				   vd.setDES(e.getValue());
		 			  break;
	 			   case "DQ" :
	 				   vd.setDQ(e.getValue());
	 				  break;
	 			   case "EDC" :
	 				   vd.setEDC(e.getValue());
		 		      break;
	 			   case "EDP" :
	 				   vd.setEDP(e.getValue());
	 			      break;
	 			   case "IICS" :
	 				   vd.setIICS(e.getValue());
	 				  break;
	 			   case "PowerCenter" :
	 				   vd.setPowerCenter(e.getValue());
	 				  break;	      
	 			   default :

	 			}
            }
            l.add(vd);
		}

		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	public String trendsDetails(String startDate, String endDate) throws ParseException {
		Map<String,Map<String,Long>> map=new HashMap<>();
		Map<String,Map<String,Long>> tempmap=new HashMap<>();
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<TrendsData> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		
		List<Object[]> ActiveCustomers = asdto.findActiveCustomers(dd, dd1);
		ActiveCustomers.forEach(data->{
			//System.out.print((Long)data[2] + "    ");
			Long c = (Long)data[2];
			Integer m = (int)data[0];
			Integer y = (int)data[1];
			String d = y.toString()+"-"+m.toString();
			//System.out.println(d);
			if (!tempmap.containsKey(d)) {
	            tempmap.put(d, new HashMap<String,Long>());
	        }
	        tempmap.get(d).put("ActiveCustomers", c);
		});
		//System.out.println();
		List<Object[]> ActiveChurnedCustomers = asdto.findActiveChurnedCustomers(dd, dd1);
		ActiveChurnedCustomers.forEach(data->{
				//System.out.print((Long)data[2] + "    ");
				Long c = (Long)data[2];
				Integer m = (int)data[0];
				Integer y = (int)data[1];
				String d = y.toString()+"-"+m.toString();
				//System.out.println(d);
				if (!tempmap.containsKey(d)) {
		            tempmap.put(d, new HashMap<String,Long>());
		        }
		        tempmap.get(d).put("ActiveChurnedCustomers", c);
		});
		//System.out.println(tempmap);
		Long ac=new Long(0);
		Long acc=new Long(0);
		for (Map.Entry<String,Map<String,Long>> entry : tempmap.entrySet())  {
			if (!map.containsKey(entry.getKey())) {
	            map.put(entry.getKey(), new HashMap<String,Long>());
	        }
			for(Map.Entry<String,Long> e : entry.getValue().entrySet()) {
				switch(e.getKey()) {
	 			   case "ActiveCustomers" :
	 				  ac=e.getValue();
	 			      break;
	 			   case "ActiveChurnedCustomers" :
	 				  acc=e.getValue();
		 			  break;
				}
			}		
			map.get(entry.getKey()).put("activeCustomers", ac-acc);
		}
		
		List<Object[]> NewCustomers = asdto.findNewCustomers(dd, dd1);
		List<Object[]> ChurnedCustomers = asdto.findChurnedCustomers(dd, dd1);
		NewCustomers.forEach(data->{
			Long c = (Long)data[0];
			Integer m = (int)data[1];
			Integer y = (int)data[2];
			String d = y.toString()+"-"+m.toString();
			if (!map.containsKey(d)) {
	            map.put(d, new HashMap<String,Long>());
	        }
	        map.get(d).put("newCustomers", c);
		});
		
		ChurnedCustomers.forEach(data->{
			Long c = (Long)data[0];
			Integer m = (int)data[1];
			Integer y = (int)data[2];
			String d = y.toString()+"-"+m.toString();
			if (!map.containsKey(d)) {
	            map.put(d, new HashMap<String,Long>());
	        }
	        map.get(d).put("churnedCustomers", c);
		});
		
		for (Map.Entry<String,Map<String,Long>> entry : map.entrySet())  {
			TrendsData td=new TrendsData(new Long(0),new Long(0),new Long(0));
			td.setUsingDate(entry.getKey());
			for(Map.Entry<String,Long> e : entry.getValue().entrySet()) {
            	switch(e.getKey()) {
	 			   case "newCustomers" :
	 				  td.setNewCustomers(e.getValue());
	 			      break;
	 			   case "churnedCustomers" :
	 				  td.setChurnedCustomers(e.getValue());
		 			  break;
	 			   case "activeCustomers" :
	 				  td.setActiveCustomers(e.getValue());
		 			  break;      
	 			   default :

	 			}
			}
			 l.add(td);
		}
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
}

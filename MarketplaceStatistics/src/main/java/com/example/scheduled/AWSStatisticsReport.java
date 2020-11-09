package com.example.scheduled;



/*
* Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
* http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.marketplacecommerceanalytics.AWSMarketplaceCommerceAnalyticsClient;
import com.amazonaws.services.marketplacecommerceanalytics.model.GenerateDataSetRequest;
import com.amazonaws.services.marketplacecommerceanalytics.model.GenerateDataSetResult;
/**
* This sample demonstrates how to make basic requests to the AWS Marketplace Commerce 
* Analytics service using the AWS SDK for Java.
* <p>
* <b>Prerequisites:</b> Follow the on-boarding guide: {URL OR SOMETHING}
* <p>
* Fill in your AWS access credentials in the provided credentials file
* template, and be sure to move the file to the default location
* (~/.aws/credentials) where the sample code will load the credentials from.
* <p>
* <b>WARNING:</b> To avoid accidental leakage of your credentials, DO NOT keep
* the credentials file in your source directory.
* <p>
* http://aws.amazon.com/security-credentials
*/
class AWSStatisticsReport {
	@SuppressWarnings("deprecation")
	public static int main(String input , int i ) throws ParseException {
		int set = -1;
	
		AWSCredentials credentials = null;
		try {
			credentials = new ProfileCredentialsProvider().getCredentials();
		} catch (Exception e) {
			throw new AmazonClientException("Cannot load the credentials from the credential profiles "+ "file. Make sure that your credentials file is at the correct "+ "location (~/.aws/credentials), and is in validformat.", e);
		}
		AWSMarketplaceCommerceAnalyticsClient client = new AWSMarketplaceCommerceAnalyticsClient(credentials);
		Region usEast1 = Region.getRegion(Regions.US_EAST_1);
		client.setRegion(usEast1);
		System.out.println("===============================================================");
		System.out.println("Getting Started with AWS Marketplace Commerce Analytics Service"); 
		System.out.println("===============================================================\n");
		// Create a data set request with the desired parameters
		Calendar cal = Calendar.getInstance();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		cal.add(Calendar.DATE, -i);
		String yesteday=dateFormat.format(cal.getTime());
		System.out.println("Yesterday's date was "+dateFormat.format(cal.getTime()));
		String date=yesteday+"T00:00:00Z";
		GenerateDataSetRequest request = new GenerateDataSetRequest();
		request.setDataSetType(input);
		request.setDataSetPublicationDate(convertIso8601StringToDateUtc(date));
		request.setRoleNameArn("arn:aws:iam::516473838419:role/MarketplaceCommerceAnalyticsRole");
		request.setDestinationS3BucketName("marketplacestatrecords");
		request.setDestinationS3Prefix("Datafeed");
		request.setSnsTopicArn("arn:aws:sns:us-east-1:516473838419:marketplaceStatTopic");
		System.out.println(
		String.format("Creating a request for data set %s for publication date %s.",
		request.getDataSetType(), request.getDataSetPublicationDate()));
		try {
			// Make the request to the service
			GenerateDataSetResult result = client.generateDataSet(request);
			// The Data Set Request ID is a unique identifier that you can use to correlate the
			// request with responses on your Amazon SNS topic 
			set=1;
			System.out.println("Request successful, unique ID: " + result.getDataSetRequestId());
		
		} catch (AmazonServiceException ase) {
			set=0;
			System.out.println("Caught an AmazonServiceException, which means your request made it "
			+ "to the AWS Marketplace Commerce Analytics service, but was rejected with an " 
			+ "error response for some reason.");
			System.out.println("Error Message: " + ase.getMessage());
			System.out.println("HTTP Status Code: " + ase.getStatusCode());
			System.out.println("AWS Error Code: " + ase.getErrorCode());
			System.out.println("Error Type: " + ase.getErrorType());
			System.out.println("Request ID: " + ase.getRequestId());
		} catch (AmazonClientException ace) {
			System.out.println("Caught an AmazonClientException, which means the client encountered "
			+ "a serious internal problem while trying to communicate with the AWS Marketplace"
			+ "Commerce Analytics service, such as not being able to access the "
			+ "network.");
			System.out.println("Error Message: " + ace.getMessage());
		}
		return set;
	}
	
	
	
	private static Date convertIso8601StringToDateUtc(String dateIso8601) throws ParseException {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		DateFormat utcDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssX");
		utcDateFormat.setTimeZone(utcTimeZone);
		return utcDateFormat.parse(dateIso8601);
	}
}
package com.example.scheduled;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.regex.Pattern;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.s3.transfer.Transfer;
import com.amazonaws.services.s3.transfer.Transfer.TransferState;
import com.amazonaws.services.s3.transfer.TransferProgress;

public class InstanceHourly {

	public static void update_data(String statistics,int i ) throws IOException, ParseException, InterruptedException {
		AWSCredentials credentials = null;
		try {
			credentials = new ProfileCredentialsProvider().getCredentials();
		} catch (Exception e) {
			throw new AmazonClientException("Cannot load the credentials from the credential profiles file. "
					+ "Please make sure that your credentials file is at the correct "
					+ "location (~/.aws/credentials), and is in valid format.", e);
		}
		AmazonS3 s3 = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.US_EAST_1).build();

		String bucketName = "marketplacestatrecords";
		  try { deleteFileWithExtension("src/main/resources/aws", ".csv"); } catch (IOException
			//try { deleteFileWithExtension("/test-users/adaggarwal/apache-tomcat-9.0.39/Datafeed/aws", ".csv"); } catch (IOException
		  e) { System.out.println("Problem occurs when deleting files");
		  e.printStackTrace(); }
		try {
			ObjectListing objectListing = s3
					.listObjects(new ListObjectsRequest().withBucketName(bucketName).withPrefix("Datafeed"));
			for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
				System.out.println(" - " + objectSummary.getKey() + "  " + "(size = " + objectSummary.getSize() + ")");
				if (Pattern.matches("^Datafeed/[a-zA-Z](.)*", objectSummary.getKey())) {
					s3.deleteObject(bucketName, objectSummary.getKey());
				} else {
					System.out.println("False");

				}
			}
			int put_custemer_data = AWSStatisticsReport.main(statistics,i);

			Thread.sleep(60*1000);

			System.out.println("Copying data");
			
			try {
				Calendar cal = Calendar.getInstance();
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				cal.add(Calendar.DATE, -i);
				String yesteday = dateFormat.format(cal.getTime());
				String instance_file = "daily_business_usage_by_instance_type_" + yesteday + ".csv";
				System.out.println(instance_file);
				S3Object fetchFile = s3.getObject(new GetObjectRequest(bucketName, "Datafeed/" + instance_file));
				final BufferedInputStream checkStream = new BufferedInputStream(fetchFile.getObjectContent());
				InputStream objectData = fetchFile.getObjectContent();
				Files.copy(objectData, new File("src/main/resources/aws/"+instance_file).toPath()); 
				//Files.copy(objectData, new File("/test-users/adaggarwal/apache-tomcat-9.0.39/Datafeed/aws/"+instance_file).toPath()); 
				Thread.sleep(30*1000);
				objectData.close();
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
		} catch (AmazonServiceException ase) {
			System.out.println("Caught an AmazonServiceException, which means your request made it "
					+ "to Amazon S3, but was rejected with an error response for some reason.");
			System.out.println("Error Message:    " + ase.getMessage());
			System.out.println("HTTP Status Code: " + ase.getStatusCode());
			System.out.println("AWS Error Code:   " + ase.getErrorCode());
			System.out.println("Error Type:       " + ase.getErrorType());
			System.out.println("Request ID:       " + ase.getRequestId());
		} catch (AmazonClientException ace) {
			System.out.println("Caught an AmazonClientException, which means the client encountered "
					+ "a serious internal problem while trying to communicate with S3, "
					+ "such as not being able to access the network.");
			System.out.println("Error Message: " + ace.getMessage());
		}

	}

	public static void deleteFileWithExtension(String directory, String extension) throws IOException {
		File dir = new File(directory);

		for (File file : dir.listFiles()) {
			if (file.getName().endsWith(extension) && !file.delete()) {
				throw new IOException();
			}
		}
	}
}

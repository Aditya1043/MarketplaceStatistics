package com.example.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.AzureSecond;

@Repository
public interface AzureSecondDAO extends JpaRepository<AzureSecond, Integer>{
	/*@Query(value = "select count(c.subId), EXTRACT(MONTH FROM c.acquiredDate), EXTRACT(YEAR FROM c.acquiredDate) from AzureSecond c where "
    		+ "c.acquiredDate BETWEEN ?1 AND ?2 group by EXTRACT(MONTH FROM c.acquiredDate),EXTRACT(YEAR FROM c.acquiredDate)")
	 List<Object[]> findSubscribersByDate(Date start, Date end,String product);*/
	 
	 @Query(value = "select count(c.subId), EXTRACT(MONTH FROM c.acquiredDate), EXTRACT(YEAR FROM c.acquiredDate) from AzureSecond c where "
	    		+ "c.acquiredDate BETWEEN ?1 AND ?2 group by EXTRACT(MONTH FROM c.acquiredDate),EXTRACT(YEAR FROM c.acquiredDate)")
	 List<Object[]> findAllSubscribersByDate(Date start, Date end);
	 //
	 //
	 /*@Query(value = "select count(c.subId) from AzureSecond c where "
	    		+ "c.acquiredDate BETWEEN ?1 AND ?2")
	 Integer findcountSubscribers(Date start, Date end,String product);*/
	 
	 @Query(value = "select count(c.subId) from AzureSecond c where "
	    		+ "c.acquiredDate BETWEEN ?1 AND ?2")
	 Integer findAllcountSubscribers(Date start, Date end);
	 //
	 //
	@Query(value = "select count(c.subId), MONTH(c.acquiredDate), YEAR(c.acquiredDate) from AzureSecond c where "
				+ "c.acquiredDate BETWEEN ?1 AND ?2 group by MONTH(c.acquiredDate), YEAR(c.acquiredDate)")
	List<Object[]> findNewCustomers(Date start, Date end);
	 
	 @Query(value = "select count(c.subId), MONTH(c.lostDate), YEAR(c.lostDate) from AzureSecond c where "
	    		+ "c.lostDate BETWEEN ?1 AND ?2 group by MONTH(c.lostDate), YEAR(c.lostDate)")
	 List<Object[]> findChurnedCustomers(Date start, Date end);
	 
	@Query(value = "select DISTINCT MONTH(c.acquiredDate), YEAR(c.acquiredDate),(select count(acq.subId)"
			+ " from AzureSecond acq where MONTH(acq.acquiredDate) < MONTH(c.acquiredDate) and YEAR(acq.acquiredDate) <= YEAR(c.acquiredDate))"
			+ " from AzureSecond c where c.acquiredDate BETWEEN ?1 AND ?2")
	List<Object[]> findActiveCustomers(Date start, Date end);
	
	@Query(value = "select DISTINCT MONTH(c.lostDate), YEAR(c.lostDate),(select count(acq.subId)"
			+ " from AzureSecond acq where MONTH(acq.lostDate) < MONTH(c.lostDate) and YEAR(acq.lostDate) <= YEAR(c.lostDate))"
			+ " from AzureSecond c where c.lostDate BETWEEN ?1 AND ?2 AND MONTH(c.lostDate) is not null")
	 List<Object[]> findActiveChurnedCustomers(Date start, Date end);
}

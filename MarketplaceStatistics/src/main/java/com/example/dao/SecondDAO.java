package com.example.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.Second;

@Repository
public interface SecondDAO extends JpaRepository<Second, Integer>{
	 @Query(value = "select count(c.customer), c.product from Second c where "
	    		+ "c.startDate BETWEEN ?1 AND ?2 AND product = ?3 group by c.product")
	 List<Object[]> findCustomersPerProduct(Date start, Date end,String product);
	 
	 @Query(value = "select count(c.customer), c.product from Second c where "
	    		+ "c.startDate BETWEEN ?1 AND ?2 group by c.product")
	 List<Object[]> findAllCustomersPerProduct(Date start, Date end);
	 //
	 //
	 @Query(value = "select count(c.customer) from Second c where "
	    		+ "c.startDate BETWEEN ?1 AND ?2 AND product = ?3")
	 Integer findcountSubscribers(Date start, Date end,String product);
	 
	 @Query(value = "select count(c.customer) from Second c where "
	    		+ "c.startDate BETWEEN ?1 AND ?2")
	 Integer findAllcountSubscribers(Date start, Date end);
	 //
	 //
	 @Query(value = "select count(c.customer), EXTRACT(MONTH FROM c.startDate), EXTRACT(YEAR FROM c.startDate) from Second c where "
	    		+ "c.startDate BETWEEN ?1 AND ?2 AND product = ?3 group by EXTRACT(MONTH FROM c.startDate),EXTRACT(YEAR FROM c.startDate)")
	 List<Object[]> findSubscribersByDate(Date start, Date end,String product);
	 
	 @Query(value = "select count(c.customer), EXTRACT(MONTH FROM c.startDate), EXTRACT(YEAR FROM c.startDate) from Second c where "
	    		+ "c.startDate BETWEEN ?1 AND ?2 group by EXTRACT(MONTH FROM c.startDate),EXTRACT(YEAR FROM c.startDate)")
	 List<Object[]> findAllSubscribersByDate(Date start, Date end);
}

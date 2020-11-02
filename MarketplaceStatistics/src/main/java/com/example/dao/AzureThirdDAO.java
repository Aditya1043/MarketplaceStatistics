package com.example.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.AzureThird;

@Repository
public interface AzureThirdDAO extends JpaRepository<AzureThird, Integer>{
	 @Query(value = "select at.sku,at.country, sum(at.visits) from AzureThird at where "
	    		+ "at.date BETWEEN ?1 AND ?2 AND at.sku = ?3 group by at.sku,at.country order by at.sku,at.country")
	 List<Object[]> findVisitsDetails(Date start, Date end,String product);
	 
	 @Query(value = "select at.sku,at.country, sum(at.visits) from AzureThird at where "
	    		+ "at.date BETWEEN ?1 AND ?2 group by at.sku,at.country order by at.sku,at.country")
	 List<Object[]> findAllVisitsDetails(Date start, Date end);
}

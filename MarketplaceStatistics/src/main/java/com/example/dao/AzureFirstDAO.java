package com.example.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.AzureFirst;

@Repository
public interface AzureFirstDAO extends JpaRepository<AzureFirst, Integer>{
	 @Query(value = "select sum(af.usage) from AzureFirst af where "
	    		+ "af.usageDate BETWEEN ?1 AND ?2 AND af.sku = ?3")
	 Integer findcountHours(Date start, Date end,String product);
	 
	 @Query(value = "select sum(af.usage) from AzureFirst af where "
	    		+ "af.usageDate BETWEEN ?1 AND ?2")
	 Integer findAllcountHours(Date start, Date end);
	 //
	 //
	 @Query(value = "select sum(c.usage), c.sku from AzureFirst c where "
	    		+ "c.usageDate BETWEEN ?1 AND ?2 AND sku = ?3 group by c.sku")
	 List<Object[]> findUsagePerProduct(Date start, Date end,String product);
	 
	 @Query(value = "select sum(c.usage), c.sku from AzureFirst c where "
	    		+ "c.usageDate BETWEEN ?1 AND ?2 group by c.sku")
	 List<Object[]> findAllUsagePerProduct(Date start, Date end);
	 //
	 //
	 @Query(value = "select sum(c.usage), c.country from AzureFirst c where "
	    		+ "c.usageDate BETWEEN ?1 AND ?2 AND sku = ?3 group by c.country")
	 List<Object[]> findUsagePerCountry(Date start, Date end,String product);
	 
	 @Query(value = "select sum(c.usage), c.country from AzureFirst c where "
	    		+ "c.usageDate BETWEEN ?1 AND ?2 group by c.country")
	 List<Object[]> findAllUsagePerCountry(Date start, Date end);
}

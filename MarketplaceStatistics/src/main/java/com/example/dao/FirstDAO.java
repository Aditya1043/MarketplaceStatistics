package com.example.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.First;

@Repository
public interface FirstDAO extends JpaRepository<First, Integer>{
	//
	//
	 @Query(value = "select sum(c.usage), c.product from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 AND product = ?3 group by c.product")
	 List<Object[]> findUsagePerProduct(Date start, Date end,String product);
	 
	 @Query(value = "select sum(c.usage), c.product from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 group by c.product")
	 List<Object[]> findAllUsagePerProduct(Date start, Date end);
	 //
	 //
	 @Query(value = "select c.company, c.product, sum(c.usage) from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 AND product = ?3 group by c.product,c.company")
	 List<Object[]> findCompanyDetails(Date start, Date end,String product);
	 
	 @Query(value = "select c.company, c.product, sum(c.usage) from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 group by c.product,c.company")
	 List<Object[]> findAllCompanyDetails(Date start, Date end);
	 //
	 //
	 @Query(value = "select sum(c.usage) from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 AND product = ?3")
	 Integer findcountHours(Date start, Date end,String product);
	 
	 @Query(value = "select sum(c.usage) from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2")
	 Integer findAllcountHours(Date start, Date end);
	 //
	 //
	@Query(value = "select sum(c.usage), f.country from First c, FirstPart f where "
	    		+ "c.company=f.company AND c.date BETWEEN ?1 AND ?2 AND c.product = ?3 group by f.country")
	 List<Object[]> findCountryDetails(Date start, Date end,String product);
	 
	@Query(value = "select sum(c.usage), f.country from First c, FirstPart f where "
	    		+ "c.company=f.company AND c.date BETWEEN ?1 AND ?2 group by f.country")
	 List<Object[]> findAllCountryDetails(Date start, Date end);
	 
	 
	 //test
	/* @Query(value = "select f.country, sum(c.usage) from First c,FirstPart f where "
	    		+ "c.company=f.company AND c.date BETWEEN ?1 AND ?2 AND product = ?3 group by f.country")
	 List<Object[]> findUsagePerCountry(Date start, Date end,String product);
	 
	 @Query(value = "select f.country, sum(c.usage) from First c,FirstPart f where "
	    		+ "c.company=f.company AND c.date BETWEEN ?1 AND ?2 group by f.country")
	 List<Object[]> findAllUsagePerCountry(Date start, Date end);

	 @Query(value = "select sum(c.revenue), c.product from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 AND product = ?3 group by c.product")
	 List<Object[]> findRevenuePerProduct(Date start, Date end,String product);
	 
	 @Query(value = "select c.product, c.instance, count(c.customer) from First c where "
	    		+ "c.date BETWEEN ?1 AND ?2 AND product = ?3 group by c.product,c.instance")
	 List<Object[]> findInstanceDetails(Date start, Date end,String product);*/
}

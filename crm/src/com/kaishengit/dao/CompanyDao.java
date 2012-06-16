package com.kaishengit.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Company;
@Repository
public class CompanyDao  extends BaseDao<Company, Integer>{

	public Company findByName(String name) {
		Query query = getSession().createQuery("from Company where name=:name");
		query.setParameter("name", name);
		return (Company) query.uniqueResult();
	}

}

package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Company;
@Repository
@SuppressWarnings("unchecked")
public class CompanyDao  extends BaseDao<Company, Integer>{

	public Company findByName(String name) {
		Query query = getSession().createQuery("from Company where name=:name");
		query.setParameter("name", name);
		return (Company) query.uniqueResult();
	}

	public List<Company> findByUid(int id) {
		Query query = getSession().createQuery("from Company as c where c.view like :me and c.view like :id"); 
		query.setParameter("me", "%m%");
		query.setParameter("id", "%" + id + "%");
		return query.list();
	}

	public List<Company> findByView() {
		Query query = getSession().createQuery("from Company as c where c.view like :all"); 
		query.setParameter("all", "%a%");
		return query.list();
	}

	public List<Company> findByGid(int id) {
		Query query = getSession().createQuery("from Company as c where c.view like :group and c.view like :id"); 
		query.setParameter("group", "%g%");
		query.setParameter("id","%" + id );
		return query.list();
	}

}

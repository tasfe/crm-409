package com.kaishengit.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.ChanceSort;
@Repository
public class ChanceSortDao  extends BaseDao<ChanceSort, Integer>{

	public ChanceSort findByName(String name) {
		Query query = getSession().createQuery("from ChanceSort where name=:name");
		query.setParameter("name", name);
		return (ChanceSort) query.uniqueResult();
	}

}

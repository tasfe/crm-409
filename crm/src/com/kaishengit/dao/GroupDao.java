package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Group;
import com.kaishengit.pojo.Product;
@Repository
@SuppressWarnings("unchecked")
public class GroupDao  extends BaseDao<Group, Integer>{

	/**
	 * 获取组
	 * @param product
	 * @return
	 */
	public List<Group> findByProduct(Product product) {
		Query query = getSession().createQuery("from Group where product=:product");
		query.setParameter("product", product);
		return query.list();
	}

	

}

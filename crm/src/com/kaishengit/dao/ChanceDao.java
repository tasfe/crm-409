package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
@Repository
@SuppressWarnings("unchecked")
public class ChanceDao extends BaseDao<Chance, Integer>{

	public List<Chance> findByUser(User user,Product product) {
		Query query = getSession().createQuery("from Chance where user=:user and product=:product");
		query.setParameter("user", user);
		query.setParameter("product",product);
		return query.list();
	}

	public List<Chance> findByGid(int id, Product product) {
		Query query = getSession().createQuery("from Chance as c where c.view like :group and c.view like :id and product=:product"); 
		query.setParameter("group", "%g%");
		query.setParameter("id","%" + id + "%");
		query.setParameter("product", product);
		return query.list();
	}

	public List<Chance> findByView(Product product) {
		Query query = getSession().createQuery("from Chance as c where c.view like :all and product=:product"); 
		query.setParameter("all", "%a%");
		query.setParameter("product", product);
		return query.list();
	}

	public List<Chance> findByViewAndU(Product product, int id) {
		Query query = getSession().createQuery("from Chance as c where c.view like :user and product=:product and c.view like :id"); 
		query.setParameter("user", "%u%");
		query.setParameter("product", product);
		query.setParameter("id","%" + id + "%");
		return query.list();
	}

	public List<Chance> findByManagerId(Product product, int id) {
		Query query = getSession().createQuery("from Chance as c where product=:product and managerid=:id"); 
		query.setParameter("product", product);
		query.setParameter("id", id);
		return query.list();
	}

}

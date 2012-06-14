package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;
@Repository
@SuppressWarnings("unchecked")
public class UserProductDao extends BaseDao<UserProduct, Integer>{

	public List<UserProduct> findByUser(User user) {
		Query query = getSession().createQuery("from UserProduct where user=:user");
		query.setParameter("user", user);
		return query.list();
	}

	/**
	 * ͨ通过pid he uid
	 * @param pid
	 * @param uid
	 * @return
	 */
	public UserProduct findByUidAndPid(int pid, int uid) {
		Query query = getSession().createQuery("from UserProduct where userid=:uid and productid=:pid");
		query.setParameter("uid", uid);
		query.setParameter("pid", pid);
		UserProduct up = (UserProduct) query.uniqueResult();
		return up;
	}

	public List<UserProduct> findByProduct(Product product) {
		Query query = getSession().createQuery("from UserProduct where product=:product");
		query.setParameter("product", product);
		
		return query.list();
	}

	public UserProduct findByUserAndProduct(User user, Product product) {
		Query query = getSession().createQuery("from UserProduct where product=:product and user=:user");
		query.setParameter("product", product);
		query.setParameter("user", user);
		return (UserProduct) query.uniqueResult();
	}


}

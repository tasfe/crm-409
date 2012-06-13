package com.kaishengit.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;
import com.kaishengit.util.MD5Util;

@Service
@Transactional
public class UserService extends BaseService{
	
	/**
	 * ͨ���û�������������û�����
	 * @param username
	 * @return
	 */
	public User findByNameAndPassword(String username,String password) {
		User user = getUserDao().findByUsernameAndPassword(username, MD5Util.getMD5(password));
		return user;
	}
	/**
	 * ͨ���û��������û�����
	 * @param username
	 * @return
	 */
	public boolean findByName(String username) {
		User user = getUserDao().findByName(username);
		return user!=null;
	}
	/**
	 * ������һ���û�
	 * @param user
	 * @param product
	 */
	public int save(User user, Product product) {
		if(product.getName() == null || "".equals(product.getName())) {
			product.setName("work-crm");
		}
		getProductDao().saveOrUpdate(product);
		
		user.setPassword(MD5Util.getMD5(user.getPassword()));
		user.setHead("1.jpg");
		getUserDao().saveOrUpdate(user);
		
		UserProduct up = new UserProduct();
		up.setProduct(product);
		up.setRole(1);
		up.setUser(user);
		getUserProductDao().saveOrUpdate(up);
		return user.getId();
	}
	/**
	 * ������߸���user
	 * @param user
	 */
	public void saveOrUpdate(User user) {
		getUserDao().saveOrUpdate(user);
	}
	
}
package com.kaishengit.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.User;

@Repository
public class UserDao extends BaseDao<User, Integer>{

	public User findByUsernameAndPassword(String username,String password) {
		String hql = "from User where username=:name and password=:pwd";
		Query query = getSession().createQuery(hql);
		
		query.setParameter("name",username);
		query.setParameter("pwd", password);
		User user = (User) query.uniqueResult();
		return user;
	}

	/**
	 * 通过用户名查找用户对象
	 * @param username
	 * @return
	 */
	public User findByName(String username) {
		String hql = "from User where username=:name";
		Query query = getSession().createQuery(hql);
		query.setParameter("name", username);
		User user = (User) query.uniqueResult();
		return user;
	}

}

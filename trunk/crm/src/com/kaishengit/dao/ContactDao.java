package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.User;
@Repository
@SuppressWarnings("unchecked")
public class ContactDao  extends BaseDao<Contact, Integer>{

	public List<Contact> findByUser(User user) {
		Query query = getSession().createQuery("from Contact where user=:user"); 
		query.setParameter("user", user);
		return query.list();
	}

	public List<Contact> findByView() {
		Query query = getSession().createQuery("from Contact as c where c.view like :all"); 
		query.setParameter("all", "a%");
		return query.list();
	}

	public List<Contact> findByUid(int id) {
		Query query = getSession().createQuery("from Contact as c where c.view like :me and c.view like :id"); 
		query.setParameter("me", "%m%");
		query.setParameter("id", "%" + id + "%");
		return query.list();
	}

	public List<Contact> findByGid(int gid) {
		Query query = getSession().createQuery("from Contact as c where c.view like :group and c.view like :id"); 
		query.setParameter("group", "%g%");
		query.setParameter("id","%" + gid + "%");
		return query.list();
	}

}

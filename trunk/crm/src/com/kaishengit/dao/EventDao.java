package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.Event;
@Repository
@SuppressWarnings("unchecked")
public class EventDao  extends BaseDao<Event, Integer>{

	public List<Event> findByContact(Contact contact) {
		Query query = getSession().createQuery("from Event where contact=:contact");
		query.setParameter("contact", contact);
		return query.list();
	}

}

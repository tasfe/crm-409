package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Chance;
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

	/**
	 * 根据机会查找事件
	 * @param chance
	 * @return
	 */
	public List<Event> findByChance(Chance chance) {
		Query query = getSession().createQuery("from Event where chance=:chance");
		query.setParameter("chance", chance);
		return query.list();
	}

}

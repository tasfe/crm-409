package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.Event;


@Service
@Transactional
public class EventService extends BaseService{

	public List<Event> findByContact(Contact contact) {
		List<Event> events = getEventDao().findByContact(contact);
		return events;
	}

	/**
	 * 把event存入数据库中
	 * @param event
	 */
	public void saveOrUpdate(Event event) {
		getEventDao().saveOrUpdate(event);
	}

	/**
	 * 
	 * @param chance
	 * @return
	 */
	public List<Event> findByContact(Chance chance) {
		List<Event> events = getEventDao().findByChance(chance);
		return events;
	}

	/**
	 * 根据eid查找event对象
	 * @param eid
	 * @return
	 */
	public Event findById(int eid) {
		Event event = getEventDao().findById(eid);
		return event;
	}

	/**
	 * 根据id删除
	 * @param eid
	 */
	public void del(int eid) {
		getEventDao().del(eid);
	}

	
	
}

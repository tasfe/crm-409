package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
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

	
	
}

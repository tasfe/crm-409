package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.Message;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.util.TimeUtil;


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
	 * @param product 
	 * @param user 
	 */
	public void saveOrUpdate(Event event, User user, Product product) {
		getEventDao().saveOrUpdate(event);
		//保存message
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setUser(user);
		m.setSort("event");
		StringBuilder sb = new StringBuilder();
		System.out.println(event.getContact().getName());
		sb.append("<strong><a href='enterContact.action?cid=" + event.getContact().getId() + "'>" + event.getContact().getName() + "</a></strong>");
		sb.append("<div class='content'><a href='eventNote.action?eid=" + event.getId() + "'>" + event.getContent() + "</a></div>");
		sb.append("<span class='author'>由 " + user.getUsername() + " 添加</span>");
		m.setContent(sb.toString());
		getMessageService().saveOrUpdate(m);
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

	public void saveOrUpdateChance(Event event, User user, Product product) {
		getEventDao().saveOrUpdate(event);
		//保存message
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setUser(user);
		m.setSort("event");
		StringBuilder sb = new StringBuilder();
		sb.append("<strong><a href='enterChance.action?id=" + event.getChance().getId() + "'>" + event.getChance().getName() + "</a></strong>");
		sb.append("<div class='content'><a href='eventNote.action?eid=" + event.getId() + "'>" + event.getContent() + "</a></div>");
		sb.append("<span class='author'>由 " + user.getUsername() + " 添加</span>");
		m.setContent(sb.toString());
		getMessageService().saveOrUpdate(m);
	}

	
	
}

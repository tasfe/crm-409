package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.EventNote;
import com.kaishengit.pojo.Message;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.util.TimeUtil;


@Service
@Transactional
public class EventNoteService extends BaseService{

	/**
	 * 添加event对象
	 * @param eventnote
	 * @param product 
	 * @param user 
	 * @return
	 */
	public int saveOrUpdate(EventNote eventnote, User user, Product product) {
		getEventNoteDao().saveOrUpdate(eventnote);
		//保存message
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setUser(user);
		m.setSort("note");
		StringBuilder sb = new StringBuilder();
		if(eventnote.getEvent().getContact() == null) {
			sb.append("<strong><a href='enterChance.action?id=" + eventnote.getEvent().getChance().getId() + "'>" + eventnote.getEvent().getChance().getName() + "</a></strong>");
		} 
		if(eventnote.getEvent().getChance() == null) {
			sb.append("<strong><a href='enterContact.action?cid=" +  eventnote.getEvent().getContact().getId() + "'>" +  eventnote.getEvent().getContact().getName() + "</a></strong>");
		}
		sb.append("<div class='content'><a href='eventNote.action?eid=" + eventnote.getEvent().getId() + "'>" + eventnote.getEvent().getContent() + "</a></div>");
		sb.append("<span class='author'>由 " + user.getUsername() + "添加</span>");
		m.setContent(sb.toString());
		
		getMessageService().saveOrUpdate(m);
		return eventnote.getId();
	}

	/**
	 * 删除事件的评论
	 * @param enid
	 */
	public void del(int enid) {
		getEventNoteDao().del(enid);
	}

	public void delByEvent(Event e) {
		getEventNoteDao().delByEvent(e);
	}

	
}

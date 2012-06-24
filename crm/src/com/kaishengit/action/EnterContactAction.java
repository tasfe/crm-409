package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.Event;

public class EnterContactAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private int cid;
	private Contact contact;
	private List<Event> events;
	@Override
	@Action("enterContact")
	public String execute() throws Exception {
		contact = getContactService().findByCid(cid);
		events = getEventService().findByContact(contact);
		return super.execute();
	}
	//get set
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	
}

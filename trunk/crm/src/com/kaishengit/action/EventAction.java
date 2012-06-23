package com.kaishengit.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
@Controller
public class EventAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private Event event;
	private String year;
	private String month;
	private String day;
	private int cid;
	private int chanceid;
	private int eid;
	
	@Override
	@Action(value="addEvent",results={
			@Result(name="success",type="redirectAction",location="enterContact.action?cid=${cid}")
	})
	public String execute() throws Exception {
		User user = (User)getSession("user");
		Product product = (Product)getSession("product");
		String time = year + "年" + month + "月" + day + "日";
		event.setCreatetime(time);
		/*System.out.println(time);
		System.out.println(cid);*/
		Contact c = getContactService().findByCid(cid);
//		System.out.println(c.getName());
		event.setContact(c);
		event.setProduct((Product)getSession("product"));
		event.setUser((User)getSession("user"));
		
		//存入数据库中
		getEventService().saveOrUpdate(event,user,product);
		return super.execute();
	}
	/*@Action("eventEdit")
	public String eventEdit() {
		return Success;
	}*/

	@Action(value="addChanceEvent",results={
			@Result(name="success",type="redirectAction",location="enterChance.action?id=${chanceid}")
	})
	public String addChanceEvent() {
		User user = (User)getSession("user");
		Product product = (Product)getSession("product");
		String time = year + "年" + month + "月" + day + "日";
		event.setCreatetime(time);
		Chance chance = getChanceService().findById(chanceid);
		if(chance != null) {
			event.setContact(chance.getContact());
		}
		event.setChance(chance);
		event.setProduct((Product)getSession("product"));
		event.setUser((User)getSession("user"));
		getEventService().saveOrUpdateChance(event,user,product);
		return SUCCESS;
	}
	
	@Action(value="eventDel",results={
			@Result(name="success",type="redirectAction",location="enterContact.action?cid=${cid}")
	})
	public String eventDel() {
		Event e = getEventService().findById(eid);
		getEventNoteService().delByEvent(e);
		getEventService().del(eid);
		return SUCCESS;
	}
	
	@Action(value="eventChaceDel",results={
			@Result(name="success",type="redirectAction",location="enterChance.action?id=${cid}")
	})
	public String eventChaceDel() {
		Event e = getEventService().findById(eid);
		getEventNoteService().delByEvent(e);
		getEventService().del(eid);
		return SUCCESS;
	}
	
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getChanceid() {
		return chanceid;
	}
	public void setChanceid(int chanceid) {
		this.chanceid = chanceid;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	
	
}

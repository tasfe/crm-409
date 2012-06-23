package com.kaishengit.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.EventNote;
import com.kaishengit.pojo.User;
import com.kaishengit.util.TimeUtil;

@Controller
public class EventNoteAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private int eid;
	private Event event;
	private EventNote eventnote;
	private int enid;
	
	@Override
	@Action("eventNote")
	public String execute() throws Exception {
		event = getEventService().findById(eid);
		return super.execute();
	}
	
	@Action(value="addnote",results={
			@Result(name="success",type="redirectAction",location="eventNote.action?eid=${eid}")
	})
	public String addnote() {
		Event event = getEventService().findById(eid);
		eventnote.setCreatetime(TimeUtil.getNow());
		eventnote.setEvent(event);
		eventnote.setUser(((User)getSession("user")));
		int id = getEventNoteService().saveOrUpdate(eventnote);
		
		eventnote.setId(id);
		return SUCCESS;
	}
	
	@Action(value="delnote",results={
			@Result(name="success",type="redirectAction",location="eventNote.action?eid=${eid}")
	})
	public String delNote() {
		getEventNoteService().del(enid);
		return SUCCESS;
	}
	//get set
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}

	public EventNote getEventnote() {
		return eventnote;
	}

	public void setEventnote(EventNote eventnote) {
		this.eventnote = eventnote;
	}

	public int getEnid() {
		return enid;
	}

	public void setEnid(int enid) {
		this.enid = enid;
	}
	
}

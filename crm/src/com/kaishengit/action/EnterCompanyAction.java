package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Company;
import com.kaishengit.pojo.Event;

public class EnterCompanyAction extends BaseAction{

	private Company company;
	private int cmid;
	private List<Event> events;
	private static final long serialVersionUID = 1L;

	@Override
	@Action("enterCompany")
	public String execute() throws Exception {
		company = getCompanyService().findbyCmId(cmid);
		return super.execute();
	}


	//get set
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}


	public int getCmid() {
		return cmid;
	}


	public void setCmid(int cmid) {
		this.cmid = cmid;
	}


	public List<Event> getEvents() {
		return events;
	}


	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	
	
}

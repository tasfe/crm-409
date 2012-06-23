package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.User;
@Controller
public class EnterChanceAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private int id;
	private List<Task> tasks;
	private List<Task> passTasks;
	private Chance chance;
	private List<Event> events;
	
	@Override
	@Action("enterChance")
	public String execute() throws Exception {
		tasks = getTaskService().findByMidAndTime(((User)getSession("user")).getId());
		passTasks = getTaskService().findByTime(((User)getSession("user")).getId());
		chance = getChanceService().findById(id);
		events = getEventService().findByContact(chance);
		return super.execute();
	}
	
	
	//get set
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public List<Task> getPassTasks() {
		return passTasks;
	}
	public void setPassTasks(List<Task> passTasks) {
		this.passTasks = passTasks;
	}
	public Chance getChance() {
		return chance;
	}
	public void setChance(Chance chance) {
		this.chance = chance;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
}

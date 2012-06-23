package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Group;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;

@Controller
public class MessageAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int pid;
	private int i;
	private List<Task> tasks;
	private List<Task> passTasks;
	private List<Group> groups;
	private List<UserProduct> userProducts;
	@Action("message")
	public String message() {
		if(i == 2) {
			putSession("welcomeindex", 2);
		}
		tasks = getTaskService().findByMidAndTime(((User)getSession("user")).getId());
		passTasks = getTaskService().findByTime(((User)getSession("user")).getId());
		groups = getGroupService().findByProduct(((Product)getSession("product")));
		userProducts = getUserProductService().findByProduct(((Product)getSession("product")));
		return SUCCESS;
	}
	
	//get set
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
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

	public List<Group> getGroups() {
		return groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public List<UserProduct> getUserProducts() {
		return userProducts;
	}

	public void setUserProducts(List<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}

	
}

package com.kaishengit.action;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.User;

@Controller
public class WelcomeAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private int id;
	private int role;
	
	@Override
	@Action("welcome")
	public String execute() throws Exception {
		role = getUserProductService().findByUidAndPid(id,((User)getSession("user")).getId());
		putSession("role", role);
		return super.execute();
	}

	//get set
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}

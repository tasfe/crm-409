package com.kaishengit.action;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;

@Controller
public class MessageAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private int pid;
	private int i;
	
	@Action("message")
	public String message() {
		if(i == 2) {
			putSession("welcomeindex", 2);
		}
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

	
	
}

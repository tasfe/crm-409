package com.kaishengit.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Group;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;

public class GroupAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private List<Group> groups;
	private String groupname;
	private int id;
	private Group group;
	@Override
	public String execute() throws Exception {
		groups = getGroupService().findByProduct((Product)getSession("product"));
		return super.execute();
	}
	
	@Action(value="addgroup",results={
			@Result(name="success",type="redirectAction",location="enterGroup.action?id=${id}")
	})
	public String addGroup() {
		Group g = new Group();
		g.setName(groupname);
		g.setProduct((Product)getSession("product"));
		Set<User> users = new HashSet<User>();
		users.add((User)getSession("user"));
		//保存组
		id = getGroupService().saveOrUpdate(g);
		
		return SUCCESS;
	}
	
	@Action("enterGroup")
	public String enterGroup() {
		group = getGroupService().findById(id);
		return SUCCESS;
	}
	
	//get set
	public List<Group> getGroups() {
		return groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}
	
}
 
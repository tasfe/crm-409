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
import com.kaishengit.pojo.UserProduct;

public class GroupAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private List<Group> groups;
	private String groupname;
	private int id;
	private Group group;
	private List<UserProduct> userProducts;
	private int gid;
	private int uid;
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
		System.out.println(groupname);
		g.setName(groupname);
		g.setProduct((Product)getSession("product"));
		Set<User> users = new HashSet<User>();
		users.add((User)getSession("user"));
		g.setUsers(users);
		//保存组
		id = getGroupService().saveOrUpdate(g);
		
		return SUCCESS;
	}
	
	@Action("enterGroup")
	public String enterGroup() {
		userProducts = getUserProductService().findByProduct(((Product)getSession("product")));
		group = getGroupService().findById(id);
		return SUCCESS;
	}
	
	@Action(value="addWorker")
	public String addWorker(){
		User user = getUserService().findById(uid);
		Group group = getGroupService().findById(gid);
		Set<User> users = group.getUsers();
		if(!users.contains(user)) {
			users.add(user);
			group.setUsers(users);
			getGroupService().saveOrUpdate(group);
			User user2 = new User();
			user2.setId(user.getId());
			user2.setUsername(user.getUsername());
			user2.setHead(user.getHead());
			
			sendJson(user2);
		}
		return null;
	}
	
	@Action(value="modifyname",results={
			@Result(name="success",type="redirectAction",location="enterGroup.action?id=${gid}")
	})
	public String modifyName() {
		Group g = getGroupService().findById(gid);
		g.setName(groupname);
		getGroupService().saveOrUpdate(g);
		return SUCCESS;
	}
	@Action(value="delWorker",results={
			@Result(name="success",type="redirectAction",location="enterGroup.action?id=${gid}")
	})
	public String delWorker() {
		Group g = getGroupService().findById(gid);
		User u = getUserService().findById(uid);
		Set<User> users = g.getUsers();
		users.remove(u);
		g.setUsers(users);
		getGroupService().saveOrUpdate(g);
		return SUCCESS;
	}
	
	@Action(value="delGroup",results={
			@Result(name="success",type="redirectAction",location="group.action")
	})
	public String delGroup() {
		getGroupService().delGroup(gid);
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

	public List<UserProduct> getUserProducts() {
		return userProducts;
	}

	public void setUserProducts(List<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
 
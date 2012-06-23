package com.kaishengit.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.ChanceSort;
import com.kaishengit.pojo.Company;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.Group;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;
import com.kaishengit.util.TimeUtil;

public class ChanceAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private String contact_name;
	private Chance chance;
	private String role;
	private int chancesortid;
	private int managerid;
	private String groupid;
	private String userid;
	private int chanceid;
	private String state;
	
	private List<UserProduct> userProducts;
	private List<Group> groups;
	private List<ChanceSort> chanceSorts;
	private Set<Chance> chances = new HashSet<Chance>();
	private int length = 0;
	private float money = 0f;
	@Override
	public String execute() throws Exception {
		List<Chance> mychance = getChanceService().findByUser(((User)getSession("user")),((Product)getSession("product")));
		//得到当前用户所在的所有小组
		User u = getUserService().findById(((User)getSession("user")).getId());
		Set<Group> groups = u.getGroups();
		Set<Chance> gchances = new HashSet<Chance>();
		for(Group g : groups) {
			gchances.addAll(getChanceService().findByGid(g.getId(),((Product)getSession("product"))));
		}
		List<Chance> achance = getChanceService().findByView(((Product)getSession("product")));
		List<Chance> uchance = getChanceService().findByUAndView(((Product)getSession("product")),((User)getSession("user")).getId());
		
		//自己负责的机会
		List<Chance> fchance =  getChanceService().findByMAndView(((Product)getSession("product")),((User)getSession("user")).getId());
		//把自己能看到的机会放到一个集合中，取消重复的
		chances.addAll(mychance);
		chances.addAll(gchances);
		chances.addAll(achance);
		chances.addAll(uchance);
		chances.addAll(fchance);
		length = chances.size();
		for(Chance chance : chances) {
			money += chance.getMoney();
		}
		return super.execute();
	}
	@Action("addchance")
	public String addchance() {
		userProducts = getUserProductService().findByProduct(((Product)getSession("product")));
		groups = getGroupService().findByProduct(((Product)getSession("product")));
		chanceSorts = getChanceSortService().findAll();
		return SUCCESS;
	}
	
	@Action(value="addc",results={
			@Result(name="error",type="redirectAction",location="addchance.action?error=10000"),
			@Result(name="success",type="redirectAction",location="chance.action")
	})
	public String addc(){
		Company cm = getCompanyService().findByName(contact_name);
		Contact c  = null;
		if(cm == null) {
			c = getContactService().findByName(contact_name); 
		}
		
		if(cm == null && c == null) {
			//输入的联系人不存在
			return ERROR;
		} else {
			if(cm == null) {
				chance.setContact(c);
			} else {
				chance.setCompany(cm);
			}
			ChanceSort cs = getChanceSortService().findById(chancesortid);
			chance.setChancesorts(cs);
			chance.setCreatetime(TimeUtil.getNow());
			chance.setManagerid(managerid);
			chance.setProduct((Product)getSession("product"));
			chance.setState("a");
			chance.setUser(((User)getSession("user")));
			
			if("all".equals(role)) {
				chance.setView("a" );
			} else if("me".equals(role)) {
				chance.setView("m" + ((User)getSession("user")).getId());
			} else if("group".equals(role)) {
				chance.setView("g:" + groupid);
			} else if("user".equals(role)) {
				chance.setView("u:" + userid);
			}
			
			//保存
			getChanceService().saveOrUpdate(chance);
			return SUCCESS;
		}
	}
	
	@Action("modifyState")
	public String modifyState() {
		boolean result = true;
		try {
			getChanceService().findById(chanceid,state);
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}
		sendJson(result);
		return null;
	}
	
	//get set
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public Chance getChance() {
		return chance;
	}
	public void setChance(Chance chance) {
		this.chance = chance;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getChancesortid() {
		return chancesortid;
	}
	public void setChancesortid(int chancesortid) {
		this.chancesortid = chancesortid;
	}
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}
	
	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public List<UserProduct> getUserProducts() {
		return userProducts;
	}
	public void setUserProducts(List<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}
	public List<Group> getGroups() {
		return groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	public List<ChanceSort> getChanceSorts() {
		return chanceSorts;
	}
	public void setChanceSorts(List<ChanceSort> chanceSorts) {
		this.chanceSorts = chanceSorts;
	}
	public Set<Chance> getChances() {
		return chances;
	}
	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public int getChanceid() {
		return chanceid;
	}
	public void setChanceid(int chanceid) {
		this.chanceid = chanceid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}

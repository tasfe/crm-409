package com.kaishengit.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Address;
import com.kaishengit.pojo.Company;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.ContactEmail;
import com.kaishengit.pojo.Group;
import com.kaishengit.pojo.Im;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.Site;
import com.kaishengit.pojo.Tel;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;
import com.kaishengit.util.TimeUtil;
@Controller
public class ContactAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private List<UserProduct> userProducts;
	private List<Group> groups;
	
	private Contact contact;
	private Company company;
	private List<String> tel;
	private List<String> teltype;
	private List<String> email;
	private List<String> emailtype;
	private List<String> im;
	private List<String> imtype;
	private List<String> site;
	private List<String> sitetype;
	private List<String> address;
	private List<String> addresstype;
	
	private String role;
	private String groupid;
	private String userid;
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	@Action("toaddcontact")
	public String toAddContact() {
		userProducts = getUserProductService().findByProduct(((Product)getSession("product")));
		groups = getGroupService().findByProduct(((Product)getSession("product")));
		return SUCCESS;
	}
	
	@Action(value="addContact",results={
			@Result(name="success",type="redirectAction",location="contact.action")
	})
	public String addContact() {
		System.out.println("userid"+userid);
		System.out.println("groupid" + groupid);
		if(company != null){
			Company c = getCompanyService().findByName(company.getName());
			if(c == null) {
				company.setUser(((User)getSession("user")));
				company.setProduct(((Product)getSession("product")));
				int companyid = getCompanyService().saveOrUpdate(company);
				company.setId(companyid);
			} else {
				company = c;
			}
		}
		if("all".equals(role)) {
			contact.setView("a" );
		} else if("me".equals(role)) {
			contact.setView("m");
		} else if("group".equals(role)) {
			contact.setView("g:" + groupid);
		} else if("user".equals(role)) {
			contact.setView("u:" + userid);
		}
		Set<Tel> tels = new HashSet<Tel>();
		Set<Address> addresses = new HashSet<Address>();
		Set<Im> ims = new HashSet<Im>();
		Set<ContactEmail> contactEmails = new HashSet<ContactEmail>();
		Set<Site> sites = new HashSet<Site>();
		//添加联系人中的多个对象集合
		for(String s : tel) {
			if(s != null){ 
				for(String r : teltype){
					Tel t = new Tel();
					t.setTel(s);
					t.setType(r);
					int id = getTelService().saveOrUpdate(t);
					t.setId(id);
					tels.add(t);
				}
			}
		}
		for(String s : im) {
			if(s != null){ 
				for(String r : imtype){
					Im i = new Im();
					i.setIm(s);
					i.setType(r);
					int id = getImService().saveOrUpdate(i);
					i.setId(id);
					ims.add(i);
				}
			}
		}
		for(String s : site) {
			if(s != null){ 
				for(String r : sitetype){
					Site si = new Site();
					si.setSite(s);
					si.setType(r);
					int id = getSiteService().saveOrUpdate(si);
					si.setId(id);
					sites.add(si);
				}
			}
		}
		for(String s : email) {
			if(s != null){ 
				for(String r : emailtype){
					ContactEmail ce = new ContactEmail();
					ce.setEmail(s);
					ce.setType(r);
					int id = getContactEmailService().saveOrUpdate(ce);
					ce.setId(id);
					contactEmails.add(ce);
				}
			}
		}
		for(String s : address) {
			if(s != null){ 
				for(String r : addresstype){
					Address a = new Address();
					a.setAddress(s);
					a.setType(r);
					int id = getAddressService().saveOrUpdate(a);
					a.setId(id);
					addresses.add(a);
				}
			}
		}
		//向contact中保存数据
		contact.setCompany(company);
		contact.setAddresses(addresses);
		contact.setContactEmails(contactEmails);
		contact.setIms(ims);
		contact.setProduct(((Product)getSession("product")));
		contact.setSites(sites);
		contact.setTels(tels);
		contact.setUser(((User)getSession("user")));
		contact.setCreatetime(TimeUtil.getNow());
		
		getContactService().saveOrUpdate(contact);
		return SUCCESS;
	}
	
	//get set
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
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
	public List<String> getTel() {
		return tel;
	}
	public void setTel(List<String> tel) {
		this.tel = tel;
	}
	public List<String> getTeltype() {
		return teltype;
	}
	public void setTeltype(List<String> teltype) {
		this.teltype = teltype;
	}
	public List<String> getEmail() {
		return email;
	}
	public void setEmail(List<String> email) {
		this.email = email;
	}
	public List<String> getEmailtype() {
		return emailtype;
	}
	public void setEmailtype(List<String> emailtype) {
		this.emailtype = emailtype;
	}
	public List<String> getIm() {
		return im;
	}
	public void setIm(List<String> im) {
		this.im = im;
	}
	public List<String> getImtype() {
		return imtype;
	}
	public void setImtype(List<String> imtype) {
		this.imtype = imtype;
	}
	public List<String> getSite() {
		return site;
	}
	public void setSite(List<String> site) {
		this.site = site;
	}
	public List<String> getSitetype() {
		return sitetype;
	}
	public void setSitetype(List<String> sitetype) {
		this.sitetype = sitetype;
	}
	public List<String> getAddress() {
		return address;
	}
	public void setAddress(List<String> address) {
		this.address = address;
	}
	public List<String> getAddresstype() {
		return addresstype;
	}
	public void setAddresstype(List<String> addresstype) {
		this.addresstype = addresstype;
	}
	
	
	
}

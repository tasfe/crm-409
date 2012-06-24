package com.kaishengit.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.google.zxing.WriterException;
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
import com.kaishengit.util.UUIDUTil;
import com.kaishengit.util.ZxingUtil;
@Controller
public class CompanyAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private List<UserProduct> userProducts;
	private List<Group> groups;
	
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
	@Action("toaddcompany")
	public String toAddContact() {
		userProducts = getUserProductService().findByProduct(((Product)getSession("product")));
		groups = getGroupService().findByProduct(((Product)getSession("product")));
		return SUCCESS;
	}
	
	@Action(value="addCompany",results={
			@Result(name="success",type="redirectAction",location="contact.action")
	})
	public String addCompany() {
		
		
	/*	if(company != null){
			Company c = getCompanyService().findByName(company.getName());
			if(c == null) {
				company.setUser(((User)getSession("user")));
				company.setProduct(((Product)getSession("product")));
				company.setView("m" + ((User)getSession("user")).getId());
				int id = getCompanyService().saveOrUpdate(company);
				company.setId(id);
			} else {
				company = c;
			}
		}*/
		if("all".equals(role)) {
			company.setView("a" );
		} else if("me".equals(role)) {
			company.setView("m" + ((User)getSession("user")).getId());
		} else if("group".equals(role)) {
			company.setView("g:" + groupid);
		} else if("user".equals(role)) {
			company.setView("u:" + userid);
		}
		//保存公司信息
		company.setProduct(((Product)getSession("product")));
		company.setUser(((User)getSession("user")));
		company.setCreatetime(TimeUtil.getNow());
		StringBuilder sb = new StringBuilder();
		sb.append("名称:" + company.getName() + " ");
		for (int i = 0; i < tel.size(); i++) {
			if(tel.get(i) != null) {
				sb.append(teltype.get(i) + ":" + tel.get(i) + " ");
			}
		}
		String code = UUIDUTil.getUUID();
		try {
			ZxingUtil.zxing(sb.toString(), code);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
		company.setCode(code + ".png");
		int contactid = getCompanyService().saveOrUpdate(company);
		company.setId(contactid);
		/*Set<Tel> tels = new HashSet<Tel>();
		Set<Address> addresses = new HashSet<Address>();
		Set<Im> ims = new HashSet<Im>();
		Set<ContactEmail> contactEmails = new HashSet<ContactEmail>();
		Set<Site> sites = new HashSet<Site>();*/
		//添加联系人中的多个对象集合
		for (int i = 0; i < tel.size(); i++) {
			if(tel.get(i) != null) {
				Tel t = new Tel();
				t.setTel(tel.get(i));
				t.setType(teltype.get(i));
				t.setCompany(company);
				getTelService().saveOrUpdate(t);
			}
		}
		for (int i = 0; i < im.size(); i++) {
			if(im.get(i) != null) {
				Im myim = new Im();
				myim.setIm(im.get(i));
				myim.setType(imtype.get(i));
				myim.setCompany(company);
				getImService().saveOrUpdate(myim);
			}
		}
		for (int i = 0; i < site.size(); i++) {
			if(site.get(i) != null){
				Site si = new Site();
				si.setSite(site.get(i));
				si.setType(sitetype.get(i));
				si.setCompany(company);
				getSiteService().saveOrUpdate(si);
			}
		}
		for (int i = 0; i < email.size(); i++) {
			if(email.get(i) != null) {
				ContactEmail ce = new ContactEmail();
				ce.setEmail(email.get(i));
				ce.setType(emailtype.get(i));
				ce.setCompany(company);
				getContactEmailService().saveOrUpdate(ce);
			}
		}
		
		for (int i = 0; i < address.size(); i++) {
			if(address.get(i) != null) {
				Address a = new Address();
				a.setAddress(address.get(i));
				a.setType(addresstype.get(i));
				a.setCompany(company);
				getAddressService().saveOrUpdate(a);
			}
		}
		
		//向company中保存数据
		
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

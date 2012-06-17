package com.kaishengit.pojo;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="t_contact")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Contact {

	private int id;
	private String name;
	private String position;
	private String weibo;
	private String content;
	private String view;
	private String createtime;
	private String code;
	private String head;
	//关联关系
	private User user;
	private Product product;
	private Set<ImporyDate> imporyDates;
	private Company company;
	private Set<Chance> chances;
	private Set<Event> events;
	private Set<Address> addresses;
	private Set<ContactEmail> contactEmails;
	private Set<Im> ims;
	private Set<Site> sites;
	private Set<Tel> tels;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWeibo() {
		return weibo;
	}
	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	//���û��Ķ��һ��ϵ
	@ManyToOne
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	//�Բ�Ʒ�Ķ��һ��ϵ
	@ManyToOne
	@JoinColumn(name="productid")
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	//����Ҫ���ڵ�һ�Զ��ϵ
	@OneToMany(mappedBy="contact")
	public Set<ImporyDate> getImporyDates() {
		return imporyDates;
	}
	public void setImporyDates(Set<ImporyDate> imporyDates) {
		this.imporyDates = imporyDates;
	}
	
	//�Թ�˾�Ķ��һ
	@ManyToOne
	@JoinColumn(name="companyid")
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	//��chance��һ�Զ�
	@OneToMany(mappedBy="contact")
	public Set<Chance> getChances() {
		return chances;
	}
	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	//��event��һ�Զ�
	@OneToMany(mappedBy="contact")
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	
	@OneToMany(mappedBy="contact")
	public Set<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}
	@OneToMany(mappedBy="contact")
	public Set<ContactEmail> getContactEmails() {
		return contactEmails;
	}
	public void setContactEmails(Set<ContactEmail> contactEmails) {
		this.contactEmails = contactEmails;
	}
	@OneToMany(mappedBy="contact")
	public Set<Im> getIms() {
		return ims;
	}
	public void setIms(Set<Im> ims) {
		this.ims = ims;
	}
	@OneToMany(mappedBy="contact")
	public Set<Site> getSites() {
		return sites;
	}
	public void setSites(Set<Site> sites) {
		this.sites = sites;
	}
	@OneToMany
	public Set<Tel> getTels() {
		return tels;
	}
	public void setTels(Set<Tel> tels) {
		this.tels = tels;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	
	
	
}

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
@Table(name="t_company")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Company {

	private int id;
	private String name;
	private String weibo;
	private String content;
	private String view;
	private String code;
	private String createtime;
	private String head;
	
	//关联关系
	private Product product;
	private User user;
	private Set<Contact> contacts;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	//�Բ�Ʒ�Ķ��һ
	@ManyToOne
	@JoinColumn(name="productid")
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	//���û��Ķ��һ
	@ManyToOne
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	//����ϵ�˵�һ�Զ�
	@OneToMany(mappedBy="company")
	public Set<Contact> getContacts() {
		return contacts;
	}
	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}
	
	//��event��һ�Զ�
	@OneToMany(mappedBy="company")
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	//��chance�� һ�Զ�
	@OneToMany(mappedBy="company")
	public Set<Chance> getChances() {
		return chances;
	}
	public void setChances(Set<Chance> chances) {
		this.chances = chances;
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
	@OneToMany(mappedBy="contact")
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

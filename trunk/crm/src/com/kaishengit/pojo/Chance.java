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
@Table(name="t_chance")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Chance {

	private int id;
	private String name;
	private float money;
	private String content;
	private String state;
	private String createtime;
	private String view;
	private int managerid;
	
	//������ϵ
	private Product product;
	private User user;
	private Contact contact;
	private Company company;
	private ChanceSort chancesorts;
	private Set<Event> events;
	
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
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
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
	
	//����ϵ�˵Ķ��һ
	@ManyToOne
	@JoinColumn(name="contactid")
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
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
	//��chancesort �Ķ��һ
	@ManyToOne
	@JoinColumn(name="chancesortid")
	public ChanceSort getChancesorts() {
		return chancesorts;
	}
	public void setChancesorts(ChanceSort chancesorts) {
		this.chancesorts = chancesorts;
	}
	//��event��һ�Զ�
	@OneToMany(mappedBy="chance")
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	
	
}

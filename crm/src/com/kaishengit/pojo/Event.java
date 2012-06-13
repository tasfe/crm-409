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
@Table(name="t_event")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Event {

	private int id;
	private String content;
	private String createtime;
	
	//������ϵ
	private Product product;
	private User user;
	private Company company;
	private Contact contact;
	private Chance chance;
	private Set<EventNote> eventnotes;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	//�Թ�˾�Ķ��һ
	@ManyToOne
	@JoinColumn(name="companyid")
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
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
	//�Ի���Ķ��һ
	@ManyToOne
	@JoinColumn(name="chanceid")
	public Chance getChance() {
		return chance;
	}
	public void setChance(Chance chance) {
		this.chance = chance;
	}
	//�����۵�һ�Զ�
	@OneToMany(mappedBy="event")
	public Set<EventNote> getEventnotes() {
		return eventnotes;
	}
	public void setEventnotes(Set<EventNote> eventnotes) {
		this.eventnotes = eventnotes;
	}
	
	
}

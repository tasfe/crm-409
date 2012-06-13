package com.kaishengit.pojo;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="t_product")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Product {

	private int id;
	private String name;
	
	//关联关系
	private Set<Contact> contacts;
	private Set<Task> tasks;
	private Set<Group> groups;
	private Set<Chance> chances;
	private Set<Event> events;
	private Set<Message> messages;
	private Set<Email> emails;
	private Set<UserProduct> userProducts;
	private Set<Company> companys;
	
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
	
	
	//对联系人的一对多
	@OneToMany(mappedBy="product")
	public Set<Contact> getContacts() {
		return contacts;
	}
	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}
	
	//对task一对多
	@OneToMany(mappedBy="product")
	public Set<Task> getTasks() {
		return tasks;
	}
	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}
	
	//对group的一对多
	@OneToMany(mappedBy="product")
	public Set<Group> getGroups() {
		return groups;
	}
	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}
	//对chance的一对多
	@OneToMany(mappedBy="product")
	public Set<Chance> getChances() {
		return chances;
	}
	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	//对event的一对多
	@OneToMany(mappedBy="product")
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	//对message的一对多
	@OneToMany(mappedBy="product")
	public Set<Message> getMessages() {
		return messages;
	}
	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}
	//对email的一对多
	@OneToMany(mappedBy="product")
	public Set<Email> getEmails() {
		return emails;
	}
	public void setEmails(Set<Email> emails) {
		this.emails = emails;
	}
	//对userProduct的一对多
	@OneToMany(mappedBy="product")
	public Set<UserProduct> getUserProducts() {
		return userProducts;
	}
	public void setUserProducts(Set<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}
	//对Company的一对多
	@OneToMany(mappedBy="product")
	public Set<Company> getCompanys() {
		return companys;
	}
	public void setCompanys(Set<Company> companys) {
		this.companys = companys;
	}
	
	
}

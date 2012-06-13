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
@Table(name="t_user")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class User {

	private int id;
	private String username;
	private String password;
	private String head;
	
	//关联关系
	private Set<Contact> contacts;
	private Set<Task> tasks;
	private Set<Chance> chances;
	private Set<Event> events;
	private Set<Message > messages;
	private Set<UserProduct> userProducts;
	private Set<UserGroup> userGroups;
	private Set<EventNote> eventNotes;
	private Set<Company> companys;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	
	
	//对联系人的一对多
	@OneToMany(mappedBy="user")
	public Set<Contact> getContacts() {
		return contacts;
	}
	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}
	//对task一对多
	@OneToMany(mappedBy="user")
	public Set<Task> getTasks() {
		return tasks;
	}
	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}
	
	//对chance的一对多
	@OneToMany(mappedBy="user")
	public Set<Chance> getChances() {
		return chances;
	}
	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	
	//对event的一对多
	@OneToMany(mappedBy="user")
	public Set<Event> getEvents() {
		return events;
	}
	public void setEvents(Set<Event> events) {
		this.events = events;
	}
	//对message的一对多
	@OneToMany(mappedBy="user")
	public Set<Message> getMessages() {
		return messages;
	}
	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}
	
	//对userProduct的一对多
	@OneToMany(mappedBy="user")
	public Set<UserProduct> getUserProducts() {
		return userProducts;
	}
	public void setUserProducts(Set<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}
	//对userGroup的一对多
	@OneToMany(mappedBy="user")
	public Set<UserGroup> getUserGroups() {
		return userGroups;
	}
	public void setUserGroups(Set<UserGroup> userGroups) {
		this.userGroups = userGroups;
	}
	//对eventNote的一对多
	@OneToMany(mappedBy="user")
	public Set<EventNote> getEventNotes() {
		return eventNotes;
	}
	public void setEventNotes(Set<EventNote> eventNotes) {
		this.eventNotes = eventNotes;
	}
	//对company的一对多
	@OneToMany(mappedBy="user")
	public Set<Company> getCompanys() {
		return companys;
	}
	public void setCompanys(Set<Company> companys) {
		this.companys = companys;
	}
	
	
	
}

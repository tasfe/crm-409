package com.kaishengit.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="t_task")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Task {

	private int id;
	private String name;
	private String createtime;
	private int state;
	private boolean enableshow;
	private int managerid;
	private String endtime;
	//������ϵ
	private User user;
	private Product product;
	private TaskSort tasksort;
	
	
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
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public boolean isEnableshow() {
		return enableshow;
	}
	public void setEnableshow(boolean enableshow) {
		this.enableshow = enableshow;
	}
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}
	//��user�Ķ��һ
	@ManyToOne
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	//��product�Ķ��һ
	@ManyToOne
	@JoinColumn(name="productid")
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	//��tasksort�Ķ��һ
	@ManyToOne
	@JoinColumn(name="tasksortid")
	public TaskSort getTasksort() {
		return tasksort;
	}
	public void setTasksort(TaskSort tasksort) {
		this.tasksort = tasksort;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	
}

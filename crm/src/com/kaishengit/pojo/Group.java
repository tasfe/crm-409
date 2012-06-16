package com.kaishengit.pojo;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
@Entity
@Table(name="t_group")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Group {

	private int id;
	private String name;
	
	//关联关系
	private Product product;
	private Set<User> users;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="[name]")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	@ManyToMany
	@JoinTable(name="t_user_group",joinColumns=@JoinColumn(name="groupid"),
			inverseJoinColumns=@JoinColumn(name="userid")
	)
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
}

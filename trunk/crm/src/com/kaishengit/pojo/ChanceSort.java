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
@Table(name="t_chancesort")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class ChanceSort {

	private int id;
	private String name;
	private String color;
	
	//������ϵ
	private Set<Chance> chances;
	
	
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	//��chance��һ�Զ�
	@OneToMany(mappedBy="chancesorts")
	public Set<Chance> getChances() {
		return chances;
	}

	public void setChances(Set<Chance> chances) {
		this.chances = chances;
	}
	
	
	
}

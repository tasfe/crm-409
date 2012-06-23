package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.ChanceSort;

public class ChanceSortAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private String name;
	private List<ChanceSort> chanceSorts;
	private String chancesort;
	private int id;
	@Override
	@Action("chancesort")
	public String execute() throws Exception {
		chanceSorts = getChanceSortService().findAll();
		return super.execute();
	}
	
	
	@Action(value="addChanceSort",results={
			@Result(name="success",type="redirectAction",location="chancesort.action")
	})
	public String addSort() {
		ChanceSort cs = getChanceSortService().findByName(chancesort);
		if(cs == null) {
			ChanceSort chanceSort = new ChanceSort();
			chanceSort.setName(chancesort);
			getChanceSortService().saveOrUpdate(chanceSort);
		}
		return SUCCESS;
	}

	@Action("delChanceSort")
	public String delSort() {
		boolean result = true;
		
		try {
			getChanceSortService().delById(id);
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}
		
		sendJson(result);
		return null;
	} 
	
	//get set
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<ChanceSort> getChanceSorts() {
		return chanceSorts;
	}


	public void setChanceSorts(List<ChanceSort> chanceSorts) {
		this.chanceSorts = chanceSorts;
	}
	public String getChancesort() {
		return chancesort;
	}
	public void setChancesort(String chancesort) {
		this.chancesort = chancesort;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}

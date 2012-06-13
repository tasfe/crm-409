package com.kaishengit.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;

public class MainAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private List<UserProduct> userProducts;
	//跳转到主页面
	@Action("main")
	public String main(){
		userProducts = getUserProductService().getUserProductByUser((User)getSession("user"));
		/*for(UserProduct u : userProducts) {
			System.out.println(u.getProduct().getName());
		}*/
		return SUCCESS;
	}
	
	//get set
	public List<UserProduct> getUserProducts() {
		return userProducts;
	}
	public void setUserProducts(List<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}
	
}

package com.kaishengit.action;

import java.util.List;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;

public class WorkerAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private List<UserProduct> userProducts;
	@Override
	public String execute() throws Exception {
		userProducts = getUserProductService().findByProduct(((Product)getSession("product")));
		UserProduct userProduct = getUserProductService().findByUserAndProduct((User)getSession("user"),(Product)getSession("product")); 
		userProducts.remove(userProduct);
		return super.execute();
	}
	
	//get set
	public List<UserProduct> getUserProducts() {
		return userProducts;
	}
	public void setUserProducts(List<UserProduct> userProducts) {
		this.userProducts = userProducts;
	}
	
	
	
}

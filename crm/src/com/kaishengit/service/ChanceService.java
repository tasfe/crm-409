package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;


@Service
@Transactional
public class ChanceService extends BaseService{

	public void saveOrUpdate(Chance chance) {
		getChancedao().saveOrUpdate(chance);
	}

	/**
	 * 通过user查找自己创建的机会
	 * @param user
	 * @param product 
	 * @return
	 */
	public List<Chance> findByUser(User user, Product product) {
		List<Chance> c =  getChancedao().findByUser(user,product);
		return c;
	}

	public List<Chance> findByGid(int id, Product product) {
		List<Chance> gchances = getChancedao().findByGid(id,product);
		return gchances;
	}

	public List<Chance> findByView(Product product) {
		List<Chance> gchances = getChancedao().findByView(product);
		return gchances;
	}

	public List<Chance> findByUAndView(Product product, int id) {
		List<Chance> gchances = getChancedao().findByViewAndU(product,id);
		return gchances;
	}

	public List<Chance> findByMAndView(Product product, int id) {
		List<Chance> gchances = getChancedao().findByManagerId(product,id);
		return gchances;
	}

	public Chance findById(int id) {
		Chance chance = getChancedao().findById(id);
		return chance;
	}

	public Chance findById(int chanceid, String state) {
		Chance chance = getChancedao().findById(chanceid);
		chance.setState(state);
		return chance;
	}

	

	
	
}

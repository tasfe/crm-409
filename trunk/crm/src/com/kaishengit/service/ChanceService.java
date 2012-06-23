package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Chance;
import com.kaishengit.pojo.Message;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.util.TimeUtil;


@Service
@Transactional
public class ChanceService extends BaseService{

	public int saveOrUpdate(Chance chance, User user, Product product) {
		System.out.println(chance.getId());
		getChancedao().saveOrUpdate(chance);
		//添加message信息
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setSort("chance");
		m.setUser(user);
		StringBuilder sb = new StringBuilder();
		sb.append("<strong><a href='enterChance.action?id=" + chance.getId() + "'>" + chance.getName() + "</a></strong>");
		sb.append("<br>" + user.getUsername() + "创建了这个机会");	
		m.setContent("<a href='enterChance.action?id=" + chance.getId() + "'></a>");
		
		getMessageService().saveOrUpdate(m);
		return chance.getId();
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

	public Chance findById(int id, String state, User user, Product product) {
		Chance chance = getChancedao().findById(id);
		chance.setState(state);
		//添加Message
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setUser(user);
		m.setSort("chance");
		StringBuilder sb = new StringBuilder();
		sb.append("<strong><a href='enterChance.action?id=" + chance.getId() + "'>" + chance.getName() + "</a></strong>");
		String str = null;
		if("a".equals(state)) {
			str = "追踪";
		} else if("b".equals(state)) {
			str = "成功";
		} else if("c".equals(state)) {
			str = "失败";
		}
		sb.append("<br>陈路 将机会状态改为 " + str);
		m.setContent(sb.toString());
		getMessageService().saveOrUpdate(m);
		return chance;
	}

	public Chance findById(int chanceid) {
		Chance chance = getChancedao().findById(chanceid);
		return chance;
	}

	

	
	
}

package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Group;
import com.kaishengit.pojo.Product;


@Service
@Transactional
public class GroupService extends BaseService{

	/**
	 * 通过产品获取该产品下的组
	 * @param session
	 * @return
	 */
	public List<Group> findByProduct(Product product) {
		List<Group> groups = getGroupDao().findByProduct(product);
		return groups;
	}

	/**
	 * 添加分组
	 * @param g
	 */
	public int saveOrUpdate(Group g) {
		getGroupDao().saveOrUpdate(g);
		return g.getId();
	}

	/**
	 * 通过id查找group
	 * @param id
	 * @return
	 */
	public Group findById(int id) {
		Group g = getGroupDao().findById(id);
		return g;
	}

	public void delGroup(int gid) {
		getGroupDao().del(gid);
	}

	
}

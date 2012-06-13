package com.kaishengit.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.User;
import com.kaishengit.pojo.UserProduct;


@Service
@Transactional
public class UserProductService extends BaseService{
	
	
	/**
	 * ͨ同过用户获取产品
	 * @param session
	 * @return
	 */
	public List<UserProduct> getUserProductByUser(User user) {
		List<UserProduct> userproducts = getUserProductDao().findByUser(user);
		return userproducts;
	}

	/**
	 * ͨ通过uid和pid获取权限
	 * @param pid
	 * @param uid
	 * @return
	 */
	public int findByUidAndPid(int pid, int uid) {
		UserProduct up = getUserProductDao().findByUidAndPid(pid,uid);
		return up.getRole();
	}
	
	
}

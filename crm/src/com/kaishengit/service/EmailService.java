package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Email;

@Service
@Transactional
public class EmailService extends BaseService{

	public void saveOrUpdate(Email e) {
		getEmailDao().saveOrUpdate(e);
	}

	public Email findByCode(String code) {
		Email e = getEmailDao().findByCode(code);
		return e;
	}

	/**
	 * 根据code进行删除
	 * @param code
	 */
	public void delByCode(String code) {
		getEmailDao().delByCode(code);
	}

	
	
}

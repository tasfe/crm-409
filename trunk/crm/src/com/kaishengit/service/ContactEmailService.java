package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.ContactEmail;

@Transactional
@Service
public class ContactEmailService extends BaseService{

	public int saveOrUpdate(ContactEmail ce) {
		getContactEmailDao().saveOrUpdate(ce);
		return ce.getId();
	}

}

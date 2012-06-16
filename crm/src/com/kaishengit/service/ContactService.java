package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Contact;


@Service
@Transactional
public class ContactService extends BaseService{

	public void saveOrUpdate(Contact contact) {
		getContactDao().saveOrUpdate(contact);
	}

	
	
}

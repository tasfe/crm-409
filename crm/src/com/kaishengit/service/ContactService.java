package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.User;


@Service
@Transactional
public class ContactService extends BaseService{

	public int saveOrUpdate(Contact contact) {
		getContactDao().saveOrUpdate(contact);
		return contact.getId();
	}

	public List<Contact> findByUser(User user) {
		List<Contact> mycontacts = getContactDao().findByUser(user);
		return mycontacts;
	}

	public List<Contact> findByView() {
		List<Contact> acontacts = getContactDao().findByView();
		return acontacts;
	}

	public List<Contact> findByUid(int id) {
		List<Contact> acontacts = getContactDao().findByUid(id);
		return acontacts;
	}

	public List<Contact> findByGid(int gid) {
		List<Contact> gcontacts = getContactDao().findByGid(gid);
		return gcontacts;
	}

	public Contact findByCid(int cid) {
		Contact contact = getContactDao().findById(cid);
		return contact;
	}

	public Contact findByName(String contact_name) {
		Contact c = getContactDao().findByName(contact_name);
		return c;
	}

	
	
	
}

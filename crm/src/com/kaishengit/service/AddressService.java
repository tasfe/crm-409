package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Address;

@Transactional
@Service
public class AddressService extends BaseService{

	public int saveOrUpdate(Address a) {
		getAddressDao().saveOrUpdate(a);
		return a.getId();
	}

}

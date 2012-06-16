package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Tel;

@Transactional
@Service
public class TelService extends BaseService{

	public int saveOrUpdate(Tel tel) {
		getTelDao().saveOrUpdate(tel);
		return tel.getId();
	}

}

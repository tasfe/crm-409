package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Im;

@Transactional
@Service
public class ImService extends BaseService{

	public int saveOrUpdate(Im i) {
		getImDao().saveOrUpdate(i);
		return i.getId();
	}

}

package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Chance;


@Service
@Transactional
public class ChanceService extends BaseService{

	public void saveOrUpdate(Chance chance) {
		getChancedao().saveOrUpdate(chance);
	}

	

	
	
}

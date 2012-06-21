package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.ImporyDate;


@Service
@Transactional
public class ImporyDateService extends BaseService{

	/**
	 * 保存重要日期
	 * @param imporyDate
	 */
	public void save(ImporyDate imporyDate) {
		getImporyDateDao().saveOrUpdate(imporyDate);
	}

	
	
}

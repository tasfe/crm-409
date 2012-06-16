package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Site;

@Service
@Transactional
public class SiteService extends BaseService{

	public int saveOrUpdate(Site si) {
		getSiteDao().saveOrUpdate(si);
		return si.getId();
	}

}

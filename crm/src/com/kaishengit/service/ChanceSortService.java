package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.ChanceSort;


@Service
@Transactional
public class ChanceSortService extends BaseService{

	public ChanceSort findById(int chancesortid) {
		ChanceSort cs = getChanceSortDao().findById(chancesortid);
		return cs;
	}

	public List<ChanceSort> findAll() {
		List<ChanceSort> cs = getChanceSortDao().findAll();
		return cs;
	}

	

	
	
}

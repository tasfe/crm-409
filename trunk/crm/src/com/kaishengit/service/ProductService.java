package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Product;


@Service
@Transactional
public class ProductService extends BaseService{

	
	public Product findBypid(int pid) {
		return getProductDao().findById(pid);
	}

	
	
	
	
}

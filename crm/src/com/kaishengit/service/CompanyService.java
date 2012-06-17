package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Company;


@Service
@Transactional
public class CompanyService extends BaseService{

	/**
	 * 保存或者更新公司信息
	 * @param company
	 */
	public int saveOrUpdate(Company company) {
		getCompanyDao().saveOrUpdate(company);
		return company.getId();
	}
	
	/**
	 * 根据公司名称查找公司
	 * @param name
	 * @return
	 */
	public Company findByName(String name) {
		Company c = getCompanyDao().findByName(name);
		return c;
	}

	public List<Company> findByUid(int id) {
		List<Company> companys = getCompanyDao().findByUid(id);
		return companys;
	}

	public List<Company> findByView() {
		List<Company> acompanys = getCompanyDao().findByView();
		return acompanys;
	}

	public List<Company> findByGid(int id) {
		List<Company> companys = getCompanyDao().findByGid(id);
		return companys;
	}

	
	
	
}

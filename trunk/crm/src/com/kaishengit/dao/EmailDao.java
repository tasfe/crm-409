package com.kaishengit.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Email;
@Repository
public class EmailDao  extends BaseDao<Email, Integer>{

	public Email findByCode(String code) {
		Query query = getSession().createQuery("from Email where code=:code");
		query.setParameter("code", code);
		return (Email) query.uniqueResult();
	}

	/**
	 * 根据code进行删除
	 * @param code
	 */
	public void delByCode(String code) {
		Query query = getSession().createQuery("delete from Email where code=:code");
		query.setParameter("code", code);
	}

}

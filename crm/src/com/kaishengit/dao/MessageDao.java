package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Message;
@Repository
@SuppressWarnings("unchecked")
public class MessageDao  extends BaseDao<Message, Integer>{

	/**
	 * 根据时间查找
	 * @return
	 */
	public List<Message> findByTime() {
		Query query = getSession().createQuery("from Message order by createtime desc");
		return query.list();
	}

}

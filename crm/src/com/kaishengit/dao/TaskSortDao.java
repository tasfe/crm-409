package com.kaishengit.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.TaskSort;
@Repository
public class TaskSortDao  extends BaseDao<TaskSort, Integer>{

	public TaskSort findByName(String name) {
		Query query = getSession().createQuery("from TaskSort where name=:name");
		query.setParameter("name", name);
		return (TaskSort) query.uniqueResult();
	}

}

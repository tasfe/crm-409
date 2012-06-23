package com.kaishengit.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.User;
import com.kaishengit.util.TimeUtil;
@Repository
@SuppressWarnings("unchecked")
public class TaskDao  extends BaseDao<Task, Integer>{

	public List<Task> findByManagerId(int id) {
		Query query = getSession().createQuery("from Task where managerid=:id and endtime>:now and state=1");
		query.setParameter("id", id);
		query.setParameter("now", TimeUtil.getNow());
		return query.list();
	}

	public List<Task> findByUser(User user) {
		Query query = getSession().createQuery("from Task where user=:user and endtime >:now");
		query.setParameter("user", user);
		query.setParameter("now", TimeUtil.getNow());
		return query.list();
	}

	/**
	 * 根据状态和managerid查找任务列表
	 * @param id
	 * @return
	 */
	public List<Task> findByManagerIdAndStat(int id) {
		Query query = getSession().createQuery("from Task where managerid=:id and state=2 and endtime>:now");
		query.setParameter("id", id);
		query.setParameter("now", TimeUtil.getNow());
		return query.list();
	}

	/**
	 * 查找过期的任务(未完成)
	 * @return
	 */
	public List<Task> findByTime(int id) {
		Query query = getSession().createQuery("from Task where managerid=:id and state=1 and endtime<:now");
		query.setParameter("id", id);
		query.setParameter("now", TimeUtil.getNow());
		return query.list();
	}

	/**
	 * 查找出自己未完成并且未过期的任务
	 * @param id
	 * @return
	 */
	public List<Task> findByMidAndTime(int id) {
		Query query = getSession().createQuery("from Task where managerid=:id and state=1 and endtime>:now");
		query.setParameter("id", id);
		query.setParameter("now", TimeUtil.getNow());
		return query.list();
	}

}

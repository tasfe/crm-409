package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.User;


@Service
@Transactional
public class TaskService extends BaseService{

	public void saveOrUpdate(Task task) {
		getTaskDao().saveOrUpdate(task);
	}

	public List<Task> findByManagerId(int id) {
		List<Task> tasks = getTaskDao().findByManagerId(id);
		return tasks;
	}

	public List<Task> findByUser(User user) {
		List<Task> mytasks = getTaskDao().findByUser(user);
		return mytasks;
	}

	public List<Task> findByStatAndManagerId(int id) {
		List<Task> tasks = getTaskDao().findByManagerIdAndStat(id);
		return tasks;
	}

	public List<Task> findByTime(int id) {
		List<Task> tasks = getTaskDao().findByTime(id);
		return tasks;
	}

	public void del(int tid) {
		getTaskDao().del(tid);
	}

	public void findById(int tid) {
		Task t = getTaskDao().findById(tid);
		t.setState(2);
	}

	public List<Task> findByMidAndTime(int id) {
		List<Task> tasks = getTaskDao().findByMidAndTime(id);
		return tasks;
	}

	
	
}

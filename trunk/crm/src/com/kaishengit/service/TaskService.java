package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Message;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.User;
import com.kaishengit.util.TimeUtil;


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

	public void del(int tid, User user, Product product, Task t) {
		getTaskDao().del(tid);
		//Message添加
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setUser(user);
		m.setSort("task");
		StringBuilder sb = new StringBuilder();
		sb.append("<del>" + t.getName() + "</del>");
		sb.append("<span class='author'> 由 " + user.getUsername() + " 完成</span>");
		m.setContent(sb.toString());
		getMessageService().saveOrUpdate(m);
	}

	public Task findById(int tid) {
		Task t = getTaskDao().findById(tid);
		t.setState(2);
		return t;
	}

	public List<Task> findByMidAndTime(int id) {
		List<Task> tasks = getTaskDao().findByMidAndTime(id);
		return tasks;
	}

	public void findById(int tid, User user, Product product) {
		Task t = getTaskDao().findById(tid);
		t.setState(2);
		//Message添加
		Message m = new Message();
		m.setCreatetime(TimeUtil.getNow());
		m.setProduct(product);
		m.setUser(user);
		m.setSort("task");
		StringBuilder sb = new StringBuilder();
		sb.append("<del>" + t.getName() + "</del>");
		sb.append("<span class='author'> 由 " + user.getUsername() + " 完成</span>");
		m.setContent(sb.toString());
		getMessageService().saveOrUpdate(m);
		
	}

	
	
}

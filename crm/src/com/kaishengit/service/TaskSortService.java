package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.TaskSort;


@Service
@Transactional
public class TaskSortService extends BaseService{

	public TaskSort findByTaskSortName(String name) {
		TaskSort ts = getTaskSortDao().findByName(name);
		return ts;
	}

	public int saveOrUpdate(TaskSort tasksort) {
		getTaskSortDao().saveOrUpdate(tasksort);
		return tasksort.getId();
	}

	
	
}

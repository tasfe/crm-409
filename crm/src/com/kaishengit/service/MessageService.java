package com.kaishengit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Message;


@Service
@Transactional
public class MessageService extends BaseService{

	public void saveOrUpdate(Message m) {
		getMessageDao().saveOrUpdate(m);
	}

	/**
	 * 查找所有的最新
	 * @return
	 */
	public List<Message> findByTime() {
		List<Message> ms = getMessageDao().findByTime();
		return ms;
	}
}

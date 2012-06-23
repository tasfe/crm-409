package com.kaishengit.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.core.BaseService;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.EventNote;


@Service
@Transactional
public class EventNoteService extends BaseService{

	/**
	 * 添加event对象
	 * @param eventnote
	 * @return
	 */
	public int saveOrUpdate(EventNote eventnote) {
		getEventNoteDao().saveOrUpdate(eventnote);
		return eventnote.getId();
	}

	/**
	 * 删除事件的评论
	 * @param enid
	 */
	public void del(int enid) {
		getEventNoteDao().del(enid);
	}

	public void delByEvent(Event e) {
		getEventNoteDao().delByEvent(e);
	}

	
}

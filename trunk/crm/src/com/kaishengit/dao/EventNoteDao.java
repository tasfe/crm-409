package com.kaishengit.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kaishengit.core.BaseDao;
import com.kaishengit.pojo.Event;
import com.kaishengit.pojo.EventNote;
@Repository
public class EventNoteDao  extends BaseDao<EventNote, Integer>{


	public void delByEvent(Event e) {
		Query query = getSession().createQuery("delete from EventNote where event=:event");
		query.setParameter("event", e);
		query.executeUpdate();
	}

}

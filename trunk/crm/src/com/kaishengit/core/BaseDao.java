package com.kaishengit.core;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDao<T,PK extends Serializable> {
	
	private SessionFactory sessionFactory;
	private Class<?> clazz;
	//获取传入对象的class
	public BaseDao() {
		ParameterizedType  t = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] types = t.getActualTypeArguments();
		clazz = (Class<?>) types[0];
	}
	
	/**
	 *设置sessionFactory
	 * @param sessionFactory
	 */
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * 获取Session
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/**
	 * ִ保存或者更新
	 * @param t
	 */
	public void saveOrUpdate(T t) throws HibernateException {
		getSession().saveOrUpdate(t);
	}  
	/**
	 * ִ根据对象删除
	 * @param t
	 */
	public void del(T t) throws HibernateException {
		getSession().delete(t);
	}
	/**
	 * 根据id删除
	 * @param id
	 */
	public void del(PK id) throws HibernateException {
		getSession().delete(findById(id));
	}
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T findById(PK id) throws HibernateException {
		return (T) getSession().get(clazz, id);
	} 
	/**
	 * 查找所有
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll() throws HibernateException {
		Criteria cri = getSession().createCriteria(clazz);
		return cri.list();
	}
}

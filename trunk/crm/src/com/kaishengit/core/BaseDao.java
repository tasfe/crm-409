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
	//��ȡ��ǰ�������ķ��͵�class
	public BaseDao() {
		ParameterizedType  t = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] types = t.getActualTypeArguments();
		clazz = (Class<?>) types[0];
	}
	
	/**
	 * ��ȡsessionFactory
	 * @param sessionFactory
	 */
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * ����Session
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/**
	 * ִ��saveOrUpdate����
	 * @param t
	 */
	public void saveOrUpdate(T t) throws HibernateException {
		getSession().saveOrUpdate(t);
	}  
	/**
	 * ִ��ɾ�����
	 * @param t
	 */
	public void del(T t) throws HibernateException {
		getSession().delete(t);
	}
	/**
	 * ���Idִ�в���
	 * @param id
	 */
	public void del(PK id) throws HibernateException {
		getSession().delete(findById(id));
	}
	/**
	 * ���Id���Ҷ���
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T findById(PK id) throws HibernateException {
		return (T) getSession().get(clazz, id);
	} 
	/**
	 * �������ж���ļ���
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll() throws HibernateException {
		Criteria cri = getSession().createCriteria(clazz);
		return cri.list();
	}
}

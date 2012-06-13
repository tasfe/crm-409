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

import com.kaishengit.pojo.User;
public class BaseDao<T,PK extends Serializable> {
	
	private SessionFactory sessionFactory;
	private Class<?> clazz;
	//获取当前传过来的泛型的class
	public BaseDao() {
		ParameterizedType  t = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] types = t.getActualTypeArguments();
		clazz = (Class<?>) types[0];
	}
	
	/**
	 * 获取sessionFactory
	 * @param sessionFactory
	 */
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * 返回Session
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 执行saveOrUpdate操作
	 * @param t
	 */
	public void saveOrUpdate(T t) throws HibernateException {
		getSession().saveOrUpdate(t);
	}  
	/**
	 * 执行删除操作
	 * @param t
	 */
	public void del(T t) throws HibernateException {
		getSession().delete(t);
	}
	/**
	 * 根据Id执行操作
	 * @param id
	 */
	public void del(PK id) throws HibernateException {
		getSession().delete(findById(id));
	}
	/**
	 * 根据Id查找对象
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T findById(PK id) throws HibernateException {
		return (T) getSession().get(clazz, id);
	} 
	/**
	 * 查找所有对象的集合
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> findAll() throws HibernateException {
		Criteria cri = getSession().createCriteria(User.class);
		return cri.list();
	}
}

package com.bdms.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdms.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void save(User user) {
		currentSession().persist(user);
		
	}

	@Override
	public User getByUsername(String username) {
		return currentSession()
                .createQuery("FROM User WHERE username = :uname", User.class)
                .setParameter("uname", username)
                .uniqueResultOptional()
                .orElse(null);
	}

	@Override
	public long countAll() {
		 return currentSession()
	                .createQuery("SELECT COUNT(u) FROM User u", Long.class)
	                .uniqueResult();
	}

	@Override
	public boolean existByUsername(String username) {
		Long count = currentSession()
                .createQuery("SELECT COUNT(u) FROM User u WHERE u.username = :uname", Long.class)
                .setParameter("uname", username)
                .uniqueResult();
        return count != null && count > 0;
	}

}

package com.bdms.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdms.model.Bloodstock;
@Repository
public class BloodstockDaoImpl implements BloodstockDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void save(Bloodstock stock) {
		currentSession().persist(stock);
		
	}

	@Override
	public void update(Bloodstock stock) {
		currentSession().merge(stock);
		
	}

	@Override
	public Bloodstock getByBloodGroup(String bloodgroup) {
		
		return currentSession().createQuery("FROM Bloodstock WHERE bloodGroup = :bg",Bloodstock.class)
				.setParameter("bg", bloodgroup)
				.uniqueResultOptional()
				.orElse(null);
	}

	@Override
	public List<Bloodstock> getAll() {
		
		return currentSession().createQuery("FROM Bloodstock ORDER BY bloodGroup",Bloodstock.class)
				.list();
	}

	@Override
	public long countAll() {
		
		return currentSession().createQuery("SELECT COUNT(s) FROM Bloodstock s",Long.class)
				.uniqueResult();
	}

}

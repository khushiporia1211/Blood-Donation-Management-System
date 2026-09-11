package com.bdms.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdms.model.Donor;


@Repository
public class DonorDaoImpl  implements DonorDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();
		
	}

	@Override
	public void save(Donor donor) {
		
		currentSession().persist(donor);
	}

	@Override
	public void update(Donor donor) {
		currentSession().merge(donor);
		
	}

	@Override
	public void delete(Long id) {
		Donor donor = getById(id);
		if(donor != null) {
			currentSession().remove(donor);
		}
		
	}

	@Override
	public Donor getById(Long id) {
		
		return currentSession().get(Donor.class, id);
	}

	
	@Override
	public List<Donor> getAll() {
		Query<Donor> query = currentSession().createQuery("FROM Donor ORDER BY id DESC",Donor.class);
		return query.getResultList();
	}

	@Override
	public List<Donor> findByBloodGroup(String bloodGroup) {
	    return currentSession()
	            .createQuery("FROM Donor WHERE bloodGroup = :bg ORDER BY name", Donor.class)
	            .setParameter("bg", bloodGroup)
	            .list();
	}

	@Override
	public List<Donor> searchByName(String name) {
		Query<Donor> query = currentSession().createQuery("FROM Donor WHERE LOWER(name) LIKE LOWER(:name) ORDER BY name",Donor.class);
		query.setParameter("name","%"+ name + "%");
		return query.getResultList();
	}
	

}

package com.bdms.dao;

import java.util.List;

import com.bdms.model.Donor;



public interface DonorDao {
		void save(Donor donor);
		void update(Donor donor);
		void delete(Long id);
		Donor getById(Long id);
		
		List<Donor> getAll();
		List<Donor> findByBloodGroup(String bloodGroup);
		List<Donor> searchByName(String name);
		
		
		
}

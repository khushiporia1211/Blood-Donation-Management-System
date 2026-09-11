package com.bdms.dao;

import java.util.List;

import com.bdms.model.Bloodstock;

public interface BloodstockDao {
	public void save(Bloodstock stock);
	public void update(Bloodstock stock);
	
	Bloodstock getByBloodGroup(String bloodgroup);
	
	List<Bloodstock> getAll();
	
	long countAll();
}

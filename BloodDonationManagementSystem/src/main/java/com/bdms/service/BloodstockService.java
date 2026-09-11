package com.bdms.service;

import java.util.List;

import com.bdms.model.Bloodstock;

public interface BloodstockService {
	List<Bloodstock> getAllStock();
	
	void initializeStockIfEmpty();
	
	void setStockUnits(String bloodGroup, int units);
	
	void addUnits(String bloodGroup,int unitsToAdd);
	
	void deductUnits(String bloodgroup,int unitsToDeduct);

}

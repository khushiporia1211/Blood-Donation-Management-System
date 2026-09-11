package com.bdms.service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdms.dao.BloodstockDao;
import com.bdms.model.Bloodstock;

@Service
public class BloodstockServiceImpl implements BloodstockService{
	
	private static final List<String> ALL_BLOOD_GROUPS =
            Arrays.asList("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-");
	
	@Autowired
	private BloodstockDao bloodStockDao;

	@Override
	@Transactional(readOnly = true)
	public List<Bloodstock> getAllStock() {
		
		return bloodStockDao.getAll();
	}

	@Override
	@Transactional
	public void initializeStockIfEmpty() {
		if(bloodStockDao.countAll()==0) {
			for(String bg:ALL_BLOOD_GROUPS) {
				Bloodstock stock = new Bloodstock(bg,0);
				stock.setLastUpdated(new Date());
				bloodStockDao.save(stock);
			}
		}
		
	}

	@Override
	@Transactional
	public void setStockUnits(String bloodGroup, int units) {
		Bloodstock stock = bloodStockDao.getByBloodGroup(bloodGroup.trim().toUpperCase());
		if(stock==null) {
			stock = new Bloodstock(bloodGroup.trim().toUpperCase(),units);
			stock.setLastUpdated(new Date());
			bloodStockDao.save(stock);
		}
		else {
			stock.setUnitsAvailable(units);
		}
		
	}

	@Override
	@Transactional()
	public void addUnits(String bloodGroup, int unitsToAdd) {
		Bloodstock stock = bloodStockDao.getByBloodGroup(bloodGroup.trim().toUpperCase());
		if(stock==null) {
			bloodStockDao.save(stock);
		}else {
			bloodStockDao.update(stock);
		}
		
		
	}

	@Override
	@Transactional
	public void deductUnits(String bloodgroup, int unitsToDeduct) {
		Bloodstock stock = bloodStockDao.getByBloodGroup(bloodgroup.trim().toUpperCase());
		if(stock != null) {
			int newTotal = stock.getUnitsAvailable()-unitsToDeduct;
			stock.setUnitsAvailable(Math.max(newTotal, 0));
			stock.setLastUpdated(new Date());
			bloodStockDao.update(stock);
		}
	}

}

package com.bdms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdms.dao.DonorDao;
import com.bdms.model.Donor;
@Service
public class DonorServiceImpl implements DonorService {
	
	@Autowired
    private BloodstockService bloodStockService;
	
	@Autowired
	private DonorDao donorDao;

	@Override
	@Transactional
	public void registerDonor(Donor donor) {
		if(donor.getBloodGroup()!=null) {
			donor.setBloodGroup(donor.getBloodGroup().trim().toUpperCase());
		}
		donor.setRegisteredOn(new Date());
		donorDao.save(donor);
		
	}

	@Override
	@Transactional
	public void updateDonor(Donor donor) {
		if(donor.getBloodGroup()!=null) {
			donor.setBloodGroup(donor.getBloodGroup().trim().toUpperCase());
		}
		donorDao.update(donor);
	}

	@Override
	@Transactional
	public void deleteDonor(Long id) {
		donorDao.delete(id);
		
	}

	@Override
	@Transactional(readOnly = true)
	public Donor getDonorById(Long id) {
		
		return donorDao.getById(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Donor> getAllDonors() {
		
		return donorDao.getAll();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Donor> getDonorByBloodGroup(String bloodGroup) {
		
		return donorDao.findByBloodGroup(bloodGroup);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Donor> searchDonorByName(String name) {
		
		return donorDao.searchByName(name);
	}

	@Override
	@Transactional
	public void recordDonation(Long donorId) {
		 // Step 1: find the donor
        Donor donor = donorDao.getById(donorId);
 
        // Step 2: update their last donation date to today
        donor.setLastDonationDate(new Date());
        donorDao.update(donor);
 
        // Step 3: add 1 unit to stock for their blood group
        bloodStockService.addUnits(donor.getBloodGroup(), 1);
		
	}

	

}

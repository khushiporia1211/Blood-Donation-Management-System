package com.bdms.service;

import java.util.List;

import com.bdms.model.Donor;

public interface DonorService  {
	
	
	 
	    void registerDonor(Donor donor);
	 
	    void recordDonation(Long donorId);
	 
	    void updateDonor(Donor donor);
	 
	    void deleteDonor(Long id);
	 
	    Donor getDonorById(Long id);
	 
	    List<Donor> getAllDonors();
	 
	    List<Donor> getDonorByBloodGroup(String bloodGroup);
	 
	    List<Donor> searchDonorByName(String name);
	}
	 
		
	



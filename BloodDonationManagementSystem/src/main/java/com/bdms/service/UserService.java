package com.bdms.service;

import com.bdms.model.User;

public interface UserService {
	void createDefaultAdminIfNoneExists();
	 
    User validateLogin(String username, String password, String requiredRole);
 
    void createDonorAccount(String username, String password, Long donorId);
 
    boolean usernameExists(String username);

}

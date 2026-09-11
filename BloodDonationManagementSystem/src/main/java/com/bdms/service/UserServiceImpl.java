package com.bdms.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bdms.dao.UserDao;
import com.bdms.model.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public void createDefaultAdminIfNoneExists() {
		 if (userDao.countAll() == 0) {
	            User admin = new User("admin", "admin123", "ADMIN");
	            userDao.save(admin);
	        }
		
	}

	@Override
	@Transactional(readOnly = true)
	public User validateLogin(String username, String password, String requiredRole) {
		User user = userDao.getByUsername(username);
        if (user != null
                && user.getPassword().equals(password)
                && user.getRole().equalsIgnoreCase(requiredRole)) {
            return user;
        }
        return null;
	}

	@Override
	@Transactional
	public void createDonorAccount(String username, String password, Long donorId) {
		User user = new User(username, password, "DONOR",donorId);
        userDao.save(user);
		
	}

	@Override
	@Transactional(readOnly=true)
	public boolean usernameExists(String username) {
		return userDao.existByUsername(username);
	}

}

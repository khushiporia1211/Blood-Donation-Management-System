package com.bdms.dao;

import com.bdms.model.User;

public interface UserDao {
	
	public void save(User user);
	
	public User getByUsername(String username);
	
	long countAll();
	
	boolean existByUsername(String username);
}

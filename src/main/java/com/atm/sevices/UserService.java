package com.atm.sevices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.User;
import com.atm.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository ur;

	public boolean registerUser(User u) {
		return ur.save(u) != null;
	}
}

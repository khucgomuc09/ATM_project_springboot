package com.atm.sevices;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.User;
import com.atm.repositories.UserRepository;
import com.atm.utils.MD5;

@Service
public class UserService {
	@Autowired
	private UserRepository ur;

	public User registerUser(User u) {
		try {
			System.out.println(u.getPassword() + "us+ ");
			System.out.println(MD5.convertToMD5(u.getPassword()));
			u.setPassword(MD5.convertToMD5(u.getPassword()));
			return ur.save(u);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	public User login(String username, String password) {

		try {
			return ur.findByUserName(username, MD5.convertToMD5(password));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}

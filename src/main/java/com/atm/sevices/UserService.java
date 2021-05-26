package com.atm.sevices;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.User;
import com.atm.repositories.UserRepository;
import com.atm.utils.MD5;

@Service
public class UserService {
	@Autowired
	private UserRepository ur;

	public User getUserbyID(int id) {
		return ur.getOne(id);

	}

	public List<User> getAllUsers() {
		return ur.findAll();
	}

	public User registerUser(User u) {
		try {
			System.out.println(u.getPassword() + "us+ ");
			u.setPassword(MD5.convertToMD5(u.getPassword()));
			System.out.println(u.getPassword() + "after+ ");
			return ur.save(u);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	public User login(String username, String password) {

		try {
			return ur.findByUserNameAndPassWord(username, MD5.convertToMD5(password));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}

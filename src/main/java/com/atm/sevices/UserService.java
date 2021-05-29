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

	public User createUser(User user) {
		return ur.save(user);
	}

	public User editUSer(User user) {
		User u = ur.getOne(user.getId());
		u.setAddress(user.getAddress());
		u.setEmail(user.getEmail());
		u.setFullname(user.getFullname());
		u.setGender(user.getGender());
		u.setLevel(user.getLevel());
		u.setPhone(user.getPhone());

		return ur.save(u);
	}

	public void deleteUser(int id) {
		ur.deleteById(id);
	}

	public boolean checkEmailExist(String email) {
		for (String s : ur.getEmail()) {
			if (s.equalsIgnoreCase(email))
				return true;
		}

		return false;
	}

	public boolean checkUsernameExist(String username) {
		for (String s : ur.getUsername()) {
			if (s.equalsIgnoreCase(username))
				return true;
		}

		return false;
	}
}

package com.atm.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.atm.entities.User;
import com.atm.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository ur;

	public User getUserbyID(int id) {
		return ur.getOne(id);

	}

	public User getUserbyUsername(String username) {
		return ur.findByUserName(username);

	}

	public List<User> getAllUsers() {
		return ur.findAll();
	}

	public User registerUser(User u) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(u.getPassword() + "us+ ");
		u.setPassword(passwordEncoder.encode(u.getPassword()));
		System.out.println(u.getPassword() + "after+ ");
		return ur.save(u);
	}

	public User login(String username, String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return ur.findByUserNameAndPassWord(username, passwordEncoder.encode(password));
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

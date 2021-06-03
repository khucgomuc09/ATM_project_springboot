package com.atm.securities;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.atm.entities.User;
import com.atm.repositories.UserRepository;

@Service
public class UserDetailServiceImp implements UserDetailsService {
	@Autowired
	private UserRepository ur;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = ur.findByUserName(username);
		UserDetails userDetails = null;
		if (user == null) {
			System.out.println("User not found! " + username);
			throw new UsernameNotFoundException("User " + username + " was not found in the database");
		} else {
//			List<String> roleNames = urs.getListRole(user.getId());

			List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
			if (user.getLevel() == 1) {
				// ROLE_USER, ROLE_ADMIN,..
				GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_ADMIN");
				grantList.add(authority);
			} else {
				GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_USER");
				grantList.add(authority);

			}

			userDetails = (UserDetails) new org.springframework.security.core.userdetails.User(user.getUsername(),
					user.getPassword(), grantList);
		}

//			return userDetails;
		return userDetails;

	}

}

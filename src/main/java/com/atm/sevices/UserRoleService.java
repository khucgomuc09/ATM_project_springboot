package com.atm.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atm.repositories.UserRoleRepository;

@Repository
public class UserRoleService {
	@Autowired
	private UserRoleRepository userRoleRepository;

	public List<String> getListRole(int userID) {

		return userRoleRepository.getListRoles(userID);
	}
}

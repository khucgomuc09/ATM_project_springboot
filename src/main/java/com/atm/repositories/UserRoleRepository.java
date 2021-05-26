package com.atm.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.atm.entities.UserRole;
@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
	@Query(nativeQuery = true, value = "select role_id from user_role where user_id=:userID")
	public List<String> getListRoles(int userID);
}

//package com.atm.securities;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import com.atm.entities.User;
//import com.atm.repositories.UserRepository;
//import com.atm.sevices.UserRoleService;
//
//@SuppressWarnings("deprecation")
//@Service
//public class UserDetailServiceImp implements UserDetailsService {
//	@Autowired
//	private UserRepository ur;
//	@Autowired
//	private UserRoleService urs;
//
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		// TODO Auto-generated method stub
//		User user = ur.findByUserName(username);
//
//		// Nếu không tìm thấy User thì mình thông báo lỗi
//		if (user == null) {
//			System.out.println("User not found! " + username);
//			throw new UsernameNotFoundException("User " + username + " was not found in the database");
//		}
//		// Khi đã có user rồi thì mình query xem user đó có những quyền gì (Admin hay
//		// User)
//		// [ROLE_USER, ROLE_ADMIN,..]
//		List<String> roleNames = urs.getListRole(user.getId());
//
//		// Dựa vào list quyền trả về mình tạo đối tượng GrantedAuthority của spring cho
//		// quyền đó
//		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
//		if (roleNames != null) {
//			for (String role : roleNames) {
//				// ROLE_USER, ROLE_ADMIN,..
//				GrantedAuthority authority = new SimpleGrantedAuthority(role);
//				grantList.add(authority);
//			}
//		}
//
//		// Cuối cùng mình tạo đối tượng UserDetails của Spring và mình cung cấp cá thông
//		// số như tên , password và quyền
//		// Đối tượng userDetails sẽ chứa đựng các thông tin cần thiết về user từ đó giúp
//		// Spring Security quản lý được phân quyền như ta đã
//		// cấu hình trong bước 4 method configure
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		UserDetails userDetails = null;
//		userDetails = (UserDetails) new org.springframework.security.core.userdetails.User(user.getUsername(),
//				passwordEncoder.encode(user.getPassword()), grantList);
//		System.out.println("pass: " + userDetails.getPassword());
////			return userDetails;
//		return userDetails;
//
//	}
//
//}

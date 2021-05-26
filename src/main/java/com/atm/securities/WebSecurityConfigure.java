//package com.atm.securities;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfigure extends WebSecurityConfigurerAdapter {
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
////	super.configure(http);
//		http.csrf().disable();
//		String[] anyOneCanAccess = { "/", "/register", "/login", "{supplier}/{id}" };
//		String[] userCanAccess = { "/logout", "/cart", "payment", "/removeCartItemSS", "delete_cartItem", "update_item",
//				"/add_items_to_cart" };
//		String[] adminCanAccess = { "admin" };
//		http.authorizeRequests().antMatchers( anyOneCanAccess).permitAll();
//
//		http.authorizeRequests().antMatchers(HttpMethod.POST, userCanAccess).access("hasAnyRole('2', '1')");
//
//		http.authorizeRequests().antMatchers(HttpMethod.POST,adminCanAccess).access("hasRole('1')");
//
//		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/error404");
//
//		http.authorizeRequests().and().formLogin()//
//				.loginProcessingUrl("/login").loginPage("/login")//
//				.defaultSuccessUrl("/").failureUrl("/login?error=true").usernameParameter("username")
//				.passwordParameter("password")
//
//				.and().logout().logoutUrl("/logout").logoutSuccessUrl("/");
//	}
//
//	@Bean
//	public BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//
//	@Autowired
//	private UserDetailServiceImp userDetailsService;
//
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//
//	}
//}

package com.atm.securities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfigure extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		String[] anyOneCanAccess = { "/", "/register", "/login", "/check_register", "/news_detail/**", "/HUAWEI/**",
				"/IPHONE/**", "/OPPO/**", "/XIAOMI/**", "/SAMSUNG/**", "/VIVO/**", "/resources/**", "/img/**",
				"/news/**", "/question", "/search/**" };
		String[] userCanAccess = { "/logout", "/cart/**", "/payment/**", "/removeCartItemSS/**", "/delete_cartItem/**",
				"/update_item/**", "/add_items_to_cart/**", "/invoice/**" };
		String[] adminCanAccess = { "/admin/**" };
		http.authorizeRequests().antMatchers(anyOneCanAccess).permitAll();

		http.authorizeRequests().antMatchers(userCanAccess).access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

		http.authorizeRequests().antMatchers(adminCanAccess).access("hasRole('ROLE_ADMIN')");

		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/error404");

		http.authorizeRequests().anyRequest().authenticated();

		http.authorizeRequests().and().formLogin()//
				.loginProcessingUrl("/j_spring_security_check").loginPage("/login")//
				.defaultSuccessUrl("/sessionUser").failureUrl("/login?isExist=false").and().logout()
				.logoutUrl("/logout").logoutSuccessUrl("/");
	}

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

// userdetail cua security
	@Autowired
	private UserDetailServiceImp userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
}

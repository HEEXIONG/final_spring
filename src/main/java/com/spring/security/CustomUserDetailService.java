package com.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.domain.UsersVO;
import com.spring.mapper.LoginMapper;
import com.spring.mapper.UsersMapper;
import com.spring.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService{

	@Setter(onMethod_ = { @Autowired })
	private LoginMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
	
		log.warn("load user by username : "+userid);
		UsersVO vo = mapper.read(userid);
		log.warn("queried by member mapper: " + vo);
		
		
		
		return vo == null ? null : new CustomUser(vo);
	}

	
}

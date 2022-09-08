package com.spring.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.domain.UsersVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private UsersVO user;
	
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	public CustomUser(UsersVO vo) {

		super(vo.getUSER_ID(), vo.getUSER_PW(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
				

		this.user = vo;
	}

	
	
}

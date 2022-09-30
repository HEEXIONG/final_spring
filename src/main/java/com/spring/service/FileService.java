package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.domain.FileVO;

@Component
public interface FileService {
	
			public List<FileVO> getfileList();
			
			public FileVO fileread(Long pdcode) throws Exception;

}

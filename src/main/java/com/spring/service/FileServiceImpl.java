package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.FileVO;
import com.spring.domain.PdVo;
import com.spring.mapper.FileMapper;
import com.spring.mapper.PdMapper;


@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileMapper filemapper;
	
		// 특정 글 조회 작업의 기능 구현
		@Override
		public List<FileVO> getfileList() {
			return filemapper.getfileList();
		}
		
		// 목록(리스트) 작업의 기능 구현
		@Override
		public FileVO fileread(Long pdcode) {
			return filemapper.fileread(pdcode);
		}
	
}

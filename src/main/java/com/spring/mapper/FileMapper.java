package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.FileVO;

public interface FileMapper {
	
	public List<FileVO> getfileList();
	
	public FileVO fileread(Long pdcode);
	
	public void updateReplyCnt(@Param("pdcode") Long pd_code, @Param("amount") int amount);
	
}

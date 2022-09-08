package com.spring.mapper;

import java.util.List;

import com.spring.domain.PdVo;

public interface PdMapper {
	
		public List<PdVo> getList();
		
		public PdVo read(Long pd_code);

}

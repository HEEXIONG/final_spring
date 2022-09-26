package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.PdVo;

public interface PdMapper {
	
		public List<PdVo> getList();
		
		public PdVo read(Long pd_code);
		
		public void updateReplyCnt(@Param("pd_code") Long pd_code, @Param("amount") int amount);

}

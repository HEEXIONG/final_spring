package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Criteria;
import com.spring.domain.Pd_ReplyVO;

public interface Pd_ReplyMapper {

	// 외래키를 사용하는 등록(create) 작업을 처리하는 insert() 추상 메서드 정의
	public int insert(Pd_ReplyVO vo);
	
	// 특정 댓글 읽기 기능의 조회(read) 작업을 처리하는 read() 추상 메서드 정의
	public Pd_ReplyVO read(Long rno);
	
	// 특정 댓글 삭제 기능의 삭제(delete) 작업을 처리하는 delete() 추상 메서드 정의
	public int delete(Long rno);  // rno = 댓글의 번호
	
	// 댓글의 수정(update)은 현재의 tbl_reply 테이블의 구조에서는 댓글의 내용(reply)과
	// 최종 수정 시간(updatedate)을 수정합니다.
	public int update(Pd_ReplyVO reply);
	
	// Page387 @Param 어노테이션과 댓글 목록 구현 : 댓글의 목록과 페이징 처리는 기존의
	// 게시물 페이징 처리와 유사하지만, 추가적으로 특정한 게시물의 댓글들만을 대상으로 하기 때문에
	// 추가로 게시물의 번호가 필요하게 됩니다. MyBatis는 두 개 이상이 데이터를 파라미터로
	// 전달하기 위해서는 1) 별도의 객체로 구성하거나, 2) Map을 이용하는 방식, 3) @Param을
	// 이용해서 이름을 사용하는 방식입니다. 여러 방식 중에서 가장 간단하게 사용할 수 있는 방식이
	// @Param을 이용하는 방식입니다. @Param의 속성값은 MyBatis에서 SQL을 이용할 때
	// '#{ }'의 이름으로 사용이 가능합니다. 이때, 페이징 처리는 기존과 동일하게 Criteria를
	// 이용합니다. 여기에 추가적으로 해당 게시물의 번호는 파라미터를 전달하도록 ReplyMapper를
	// 구성합니다.
	public List<Pd_ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("pd_code") Long pd_code);
	// 참고로, XML로 처리할 때에는 지정된 'cri'와 'bno'를 모두 사용할 수 있습니다.
	
	// Page432 댓글의 숫자 파악 : 댓글들을 페이징 처리하기 위해서는 해당게시물의 전체 댓글의
	// 숫자를 파악해서 화면에 보여줘야 합니다 ReplyMapper 인터페이스에
	// getCountByBno()메서드를 추가합니다
	public int getCountByBno(Long pd_code);
	
	
	
}

package com.spring.domain;

import lombok.Getter;
import lombok.ToString;

// 화면에 페이징 처리를 위한 여러 정보를 전달하는 클래스 작성
@Getter
@ToString
public class PageDTO {

	private int startPage;  // 시작 페이지(startPage) 필드 정의
	private int endPage;    // 끝 페이지(endPage) 필드 정의
	private boolean prev, next;  // 이전(prev), 다음(next) 필드 정의
	
	private int total;   // 합계(total) 필드 정의
	private Criteria cri;
	
	// pageDTO 생성자는 Criteria와 전체 데이터 수(total)을 파라미터로 지정합니다.
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total*1.0)/cri.getAmount()));
		
		if(realEnd < this.endPage){
		    this.endPage = realEnd;
		}
		
		// 이전(prev)의 경우, 시작 번호(startPage)가 1보다 큰 경우라면 존재하게 됩니다.
		this.prev = this.startPage > 1;
		
		// 다음(next)으로 가는 링크의 경우 realEnd가 끝 번호(endPage)보다 큰 경우에만
		// 존재하게 됩니다.
		this.next = this.endPage < realEnd;
	}
	
}

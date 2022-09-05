package com.spring.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// Criteria는 '검색의 기준'을 의미하는 네이밍입니다.
@Getter @Setter @ToString
public class Criteria {

	private int pageNum; // 페이지 번호(pageNum)
	private int amount; // 한 페이지당 몇개의 데이터(amount)
	
	private String type;
	private String keyword;
		
	// 생성자를 통해 기본값을 1페이지, 한 페이지당 10개의 데이터로 지정해서 처리합니다.
	public Criteria() {
		this(1, 10);
	}

	// Criteria 클래스의 용도는 pageNum와 amount 값을 전달하는 용도로 활용합니다.
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// getTypeArr() 메서드는 검색 조건이 각 글자(T, C, W)로 구성되어 있으므로
	// 검색 조건을 배열로 만들어서 한 번에 처리하기 위함입니다.
	// getTypeArr()을 이용해서 MyBatis의 동적 태그를 활용할 수 있습니다.
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	// page580 Criteria 수정 : 게시물의 삭제 후에 페이지 번호나 검색 조건을 유지하면서 이동하기 위해서는 'redirect'에 필요한 파라미터들을 매번 추가해야하는
	// 불편함이 있습니다. UriComponentsBuilder클래스를 활용하여 브라우저에서 GET방식 등의 파라미터 전송에 사용되는 한글타자연습 문자열(쿼리스트링 query string)을
	// 손쉽게 처리하도록 합니다.
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
														   .queryParam("pageNum", this.pageNum)
														   .queryParam("amount", this.getAmount())
														   .queryParam("type", this.getType())
														   .queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}


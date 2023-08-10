package com.peazh.web.dto;

import lombok.Data;

@Data
public class BoardDTO {// 컬럼 이름만 바꾸면 됨
	private int bno, blike, commentcount;
	private String btitle, bcontent, m_name, m_id, bdate, bip; 

}

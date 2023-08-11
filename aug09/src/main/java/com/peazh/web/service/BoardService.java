package com.peazh.web.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.peazh.web.dao.BoardDAO;
import com.peazh.web.dto.BoardDTO;
import com.peazh.web.util.Util;

@Service
public class BoardService {
	
	@Autowired
	private Util util;

	@Autowired
	private BoardDAO boardDAO;
	
	@GetMapping
	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}

	public BoardDTO datail(int bno) {
		
		// 조회수 +1 하기
		boardDAO.readUp(bno);
		return boardDAO.detail(bno);
	}

	public int write(BoardDTO dto) {
		// ip 만들기
		dto.setBip(util.getIp());
		
		// uuid 만들기
		dto.setUuid(UUID.randomUUID().toString());
		
		return boardDAO.write(dto);
		
	}

}

package com.peazh.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.peazh.web.dao.BoardDAO;
import com.peazh.web.dto.BoardDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@GetMapping
	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}

	public String datail(int bno) {
		return boardDAO.detail(bno);
	}

}

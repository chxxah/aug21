package com.peazh.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peazh.web.dao.MultiBoardDAO;

@Service
public class MultiBoardService {
	
	@Autowired
	private MultiBoardDAO mbDAO;

	public List<Map<String, Object>> list(int board) {
		return mbDAO.list(board);
	}

	public int mbWrite(Map<String, Object> map) {
		return mbDAO.mbWrite(map);
	}

	public Map<String, Object> mbdetail(int mb_no) {
		return mbDAO.mbdetail(mb_no);
	}

}

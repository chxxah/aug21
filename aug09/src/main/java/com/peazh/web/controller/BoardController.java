package com.peazh.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peazh.web.dto.BoardDTO;
import com.peazh.web.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board")
	public String board(Model model) {
		
		List<BoardDTO> list = boardService.boardList();
		model.addAttribute("list", list);
		
		return "board";
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam("bno") int bno ) {
		
		BoardDTO dto = boardService.datail(bno);
		
		JSONObject json = new JSONObject();
		
		json.put("content", dto.getBcontent());
		json.put("uuid", dto.getUuid());
		
		System.out.println(json.toString());
		
		return json.toString();
	}
	
	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setM_id("peazh");
		dto.setBip("0.0.0.0");
		
		int result = boardService.write(dto);
		System.out.println(result);
		return "redirect:/board";
	}
	
	
	@PostMapping("/delete")
	public String delete(BoardDTO dto) {
		System.out.println(dto.getBno());
		System.out.println(dto.getUuid());
		return "redirect:/board";
	}

}

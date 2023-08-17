package com.peazh.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.peazh.web.service.MultiBoardService;

@Controller
public class MultiBoardController {
	
	@Autowired
	private MultiBoardService mbService;
	
	@GetMapping("/multiboard")
	// required = false 안들어와도 된다는 뜻 true면 반드시 들어와야 함
	public String multiboard(@RequestParam(value = "board", required = false, defaultValue = "1") int board, Model model) {
		
		List<Map<String, Object>> list = mbService.list(board);
		
		model.addAttribute("list", list);
		
		return "multiboard";
	}
	
	@GetMapping("/mbwrite")
	public String mbwrite(@RequestParam(value = "board", required = false, defaultValue = "1") int board, Model model, HttpSession session) {
		//로그인한 사용자만 접근할 수 있게 하기
		if (session.getAttribute("mid") != null && session.getAttribute("mid") != "") {
			model.addAttribute("board", board);
			return "mbwrite";
		} else {
			return "redirect:/login?error=login";
		}
	}
	
	@PostMapping("/mbwrite")
	public String mbWrite(@RequestParam Map<String, Object> map, HttpSession session) {
		//로그인 했는지 검사하기
		if (session.getAttribute("mid") != null && session.getAttribute("mid") != "") {
			map.put("mid", session.getAttribute("mid"));
			//보드의 번호를 가져오기 -> selectKey라는 기법
			int result = mbService.mbWrite(map);
			System.out.println(map);
			return "redirect:/mbdetail?mb_no=" + map.get("mb_no");
		} else {
			return "redirect:/login?error=login";
		}
	}
	
	@GetMapping("/mbdetail")
	public String mbdetail(@RequestParam(value = "mb_no", required = true) int mb_no, Model model) {
		System.out.println(mb_no);
		Map<String, Object> detail = mbService.mbdetail(mb_no);
		model.addAttribute("detail", detail);
		return "mbdetail";
	}
}

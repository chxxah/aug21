package com.peazh.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.peazh.web.service.AdminService;
import com.peazh.web.util.Util;

@Controller
@RequestMapping("/admin") //admin 밑에 들어가라는 소리 (최상위를 알려줌Ø)
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private Util util;
	
	@GetMapping(value = {"/", "/admin"})
	public String adminIndex() {
		return "admin/index";//admin폴더 안에 index.jsp가 들어감
	}
	
	@PostMapping("/login")
	public String adminLogin(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);//사용자가 입력한 값
		Map<String, Object> result = adminService.adminLogin(map);// db에서 받은 값
		
		if (util.obj2Int(result.get("count")) == 1 && util.obj2Int(result.get("m_grade")) > 5) {
			//세션 올리기
			session.setAttribute("mid", map.get("id"));
			session.setAttribute("mname", result.get("m_name"));
			session.setAttribute("mgrade", result.get("m_grade"));
			
			//메인으로 이동하기
			return "redirect:/admin/main";
			
		} else {
			return "redirect:/admin/admin?error=login";
		}
	}

}

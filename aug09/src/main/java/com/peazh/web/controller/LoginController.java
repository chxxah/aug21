package com.peazh.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.peazh.web.service.LoginService;




@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String index() {
		return "login";
	}
	
	// 프레임워크 프로그래밍 로그인 하기
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session) {
		//세션이 있다면 다른 곳으로 이동
		// id/pw이 있다
		Map<String, Object> result = loginService.login(map);
		//정상 로그인이라면 세션 만들고 index로 이동
		if ( Integer.parseInt(String.valueOf(result.get("count"))) == 1 ) {
			session.setAttribute("mid", map.get("id"));
			session.setAttribute("mname", result.get("m_name"));
			if (session.getAttribute("mid") != null && session.getAttribute("mid") != "") {
				return "redirect:/";
			} else {
				return "login";
			}
		} else {
			//다시 로그인으로 가기
			return "login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		if (session.getAttribute("mname") != null) {
			session.removeAttribute("mname");
		}
		
		// 다른 방법
		session.invalidate(); // 이 브라우저에서 연결된 session 모두 지우기
		return "redirect:/";
	}

}

package com.peazh.web.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("/main")
	public String main() {
		return "admin/main";// 폴더를 적어줘야 admin 밑에 main.jsp를 열어줌
	}
	
	@GetMapping("notice")
	public String notice(Model model) {
		List<Map<String, Object>> notice = adminService.notice();
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "admin/notice";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(@RequestParam("upFile") MultipartFile upfile, @RequestParam Map<String, Object> map, HttpSession session) {
		// {title=제목, content=내용, upFile=}
		// System.out.println(map);
		map.put("mno", 11);
		
		
		//upfile이 null이 아닐 때 파일 업로드하기
		if (upfile.getSize() > 0) { // == !upfile.isEmpty() 파일이 비어있지 않다면
			//upfile 정보 보기
			System.out.println(upfile);// 주소값이 나옴
			System.out.println(upfile.getOriginalFilename());// 실제 파일 이름 가져오기 (kakao.png)
			System.out.println(upfile.getSize());// 파일의 크기 (10020)
			System.out.println(upfile.getContentType());// 파일이 어떤 타입인지 (image/png)
			
			//저장할 경로명 뽑기 (request)
			//실제 경로를 뽑아주는 명령어
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String path = request.getServletContext().getRealPath("/upload");
			System.out.println("실제 경로 : " + path);// /Users/chxxah/git/bootstrap/aug09/src/main/webapp/upload
			
			//파일 객체 만들기
			//저장할 파일명칭 들어감
			File newFileName = new File(upfile.getOriginalFilename()); // 실제 파일 이름을 넣어주기
		}
		
		//adminService.noticeWrite(map);
		return "redirect:/admin/notice";
	}

}

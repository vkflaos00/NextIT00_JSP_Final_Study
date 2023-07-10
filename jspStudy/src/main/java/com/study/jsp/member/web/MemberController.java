package com.study.jsp.member.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.jsp.member.service.MemberService;
import com.study.jsp.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	// 회원가입 화면 응답 메소드
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	// 회원가입 처리 메소드
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		
		// POST로 전달되어 온 파라미터값이 한글이라면
		// request 객체에 인코딩 설정을 해주어야 한다.
		// form 태그의 POST방식 action으로 요청을 받는
		// 메소드마다 아래의 코드를 넣어주어야 한다.
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("memId");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		System.out.println("name = " + name);
		
		MemberVO member = new MemberVO(id, pw, name);
		
		memberService.registMember(member);
		
		// 회원가입 끝나면 어디로???
		// 홈, 로그인, 회원가입이 완료
		return "redirect:/"; 
	}
	
	// 로그인 화면 응답 메소드
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request, Model model) {
		
		String fromUrl = request.getHeader("Referer");
		
		model.addAttribute("fromUrl", fromUrl);
		
		return "member/loginView";
	}
	
	// 로그인 처리 메소드
	@PostMapping("/loginDo")
	public String loginDo(MemberVO member, Model model
			, HttpSession session, boolean rememberId
			, HttpServletResponse response, String fromUrl) {
		
		System.out.println(member);
		System.out.println("rememberId = " + rememberId);
		System.out.println("fromUrl = " + fromUrl);
		
		try {
			MemberVO login = memberService.loginMember(member);
			System.out.println("로그인 성공");
			System.out.println(login);
			
			// 세션 객체에 로그인 정보 담기
			session.setAttribute("login", login);
			
			// 아이디 기억하기 체크했다.
			// 쿠키에 아이디 저장
			if(rememberId == true) {
				
				// 쿠키 객체 생성
				Cookie cookie = new Cookie("rememberId", login.getMemId());
				
				// response 객체에 쿠키를 담아서 전달
				response.addCookie(cookie);
				
			}else {
				// 아이디 기억하기 체크하지 않음
				
				// rememberId 키값을 가지는 쿠키를 삭제시켜주기
				// = rememberId 키값을 가지는 쿠키를 생성하고
				//   유통기한을 0으로 설정해서 전달한다.
				Cookie cookie = new Cookie("rememberId", "메롱");
				cookie.setMaxAge(0);  // 이 쿠키가 브라우저로 저장된 후 0초 후 소멸
				
				response.addCookie(cookie);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패: " + e.getMessage());
			
			model.addAttribute("errMsg", e.getMessage());
			
			return "errView";
		}
		
		return "redirect:" + fromUrl;
	}
	
	
	// 로그아웃 처리 메소드
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session, HttpServletRequest request) {
		
		// 해당 클라이언트에 대한 세션객체 제거
		session.invalidate();
		
		// 현재 /logoutDo를 요청한 URL 링크  
		String fromUrl = request.getHeader("Referer");
		System.out.println(fromUrl);
		
		return "redirect:" + fromUrl;
	}
	
	// 마이페이지 응답 메소드
	@RequestMapping("/mypageView")
	public String mypageView() {

		return "/member/mypageView";
	}
	
	// 회원 수정 처리 메소드
	@PostMapping("/memberEditDo")
	public String memberEditDo(MemberVO member, HttpSession session) {
		System.out.println("editMember =" + member);
		
		// DB에 회원정보 수정 쿼리문 전송
		memberService.editMember(member);
		
		// 기존 세션에 로그인 객체(MemberVO) 덮어쓰기(비번은 빠져있음)
		session.invalidate();
		
		return "redirect:/mypageView";
	}
	
	// 회원 삭제 처리 메소드
	@PostMapping("/memberDelDo")
	public String memberDelDo(HttpSession session) {
		
		MemberVO login = (MemberVO)session.getAttribute("login");
		String memId = login.getMemId();
		
		// DB에 회원 삭제 쿼리문 전송
		memberService.delMember(memId);
		
		// 세션에 저장된 로그인 정보 삭제
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
}

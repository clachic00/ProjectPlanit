//회원가입 시 verify 된 회원만 login 처리 해주어야함!!


package com.aia.it.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.member.model.LoginRequest;
import com.aia.it.member.service.LoginService;
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	/*
	 * @RequestMapping(method = RequestMethod.GET) public String loginForm() {
	 * 
	 * 
	 * return "login"; }
	 */
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView KakaoLoginForm(HttpSession session) {
		ModelAndView mav = new ModelAndView(); 

		String kakaoUrl = KakaoApiController.getAuthorizationUrl(session);
		mav.addObject("kakao_url", kakaoUrl);
		System.out.println("KakaoLoginController.kakaoLoginForm " + kakaoUrl);
		return mav;
	}
	
	@RequestMapping(produces = "text/html; charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String login(
			LoginRequest loginRequest,
			HttpSession session,
			HttpServletResponse response
			) {
		
//		model.addAttribute("result", loginService.login(loginRequest, session, response));
		System.out.println("여기는 로긴 컨트롤러: " + loginService.login(loginRequest, session, response));
		
		String result = loginService.login(loginRequest, session, response);
		
		
		return result;
	}

}
















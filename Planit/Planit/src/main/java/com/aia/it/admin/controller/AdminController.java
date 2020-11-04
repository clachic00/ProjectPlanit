package com.aia.it.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.admin.model.Admin;
import com.aia.it.admin.service.AdminServiceImpl;
import com.aia.it.member.controller.LoginController;

@Controller
@RequestMapping("/admin/adminLogin")
public class AdminController {

	@Autowired // 서비스를 호출하기 위해서 의존성을 주입
	AdminServiceImpl adminservice;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class); // 로깅을 위한 변수

	// 메뉴 페이지에서 관리자 로그인 버튼을 클릭하면 맵핑되는 메소드
	// 관리자 로그인 페이지로 이동시킨다.
	
	@RequestMapping(method = RequestMethod.GET)
	public String admin_login_view() {

		return "admin/adminLogin";
	}

	// 관리자 로그인 페이지에서 관리자 아이디와 패스워드를 입력후 로그인 버튼을 누를시에 맵핑되는 메소드
	// 관리자 로그인을 할 수 있도록 한다.
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView admin_login(String adminId, String adminPw, HttpSession session) throws Exception {

		// 로그인 체크도 같이 함
		// dto에 값들을 넣기 위해 객체를 생성한다.
		Admin admin = new Admin();

		admin.setAdminId(adminId);
		admin.setAdminPw(adminPw);

		// 로그인 체크를 하기위한 메소드, 로그인 체크후 결과를 result 변수에 넣는다.
		boolean result = adminservice.loginCheck(admin, session);
		ModelAndView mav = new ModelAndView();

		if (result) {// 로그인이 성공했을시 출력되는 구문
			mav.setViewName("admin/adminPage"); // 로그인이 성공했을시 이동하게되는 뷰의 이름
			mav.addObject("adminId", session.getAttribute(adminId));

		} else if (session.getAttribute(adminId) == null) { // 로그인 실패 했을시 출력

			// 로그인이 실패했을 시에 다시 관리자 로그인 페이지로 이동함

			mav.setViewName("admin/adminLogin");

			// 뷰에 전달할 값

			mav.addObject("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");

		}

		return mav;
	}


}

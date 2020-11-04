package com.aia.it.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aia.it.board.service.BoardListService;

@Controller
public class BoardListUidController {
	
	@Autowired
	private BoardListService listService;
	
	
	   //사용자가 요청하는거 : http://localhost:8080/it/board/view/숫자
	   @RequestMapping("/board/boardMyList/{uidx}") 
	   public String getBoardInfo(
	         @PathVariable("uidx") int uidx,
	         Model model,
	         HttpServletRequest request,
				HttpServletResponse response) {
		   
		   
	      model.addAttribute("viewBoard",listService.getUidxBoardList(uidx, request));
	      return "board/boardMyView";
	   }
	   


}

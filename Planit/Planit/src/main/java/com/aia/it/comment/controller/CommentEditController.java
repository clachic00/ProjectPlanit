package com.aia.it.comment.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aia.it.board.model.BoardEditRequest;
import com.aia.it.board.service.BoardEditService;
import com.aia.it.comment.model.Comment;
import com.aia.it.comment.model.CommentEditRequest;
import com.aia.it.comment.service.CommentEditService;

@Controller
@RequestMapping("/comment/commentEdit")
public class CommentEditController {
   
   @Autowired
   private CommentEditService editService;
   
   
   @RequestMapping(method = RequestMethod.GET)
   public String getCommentdEditForm(
         @RequestParam("cidx") int cidx,
         Model model) {
      model.addAttribute("comment", editService.getComment(cidx));
      return"comment/commentEditForm";
   }
   
   
   @RequestMapping(method = RequestMethod.POST)
   public ModelAndView getCommentEdit(
         Comment comment,
         HttpServletRequest request,
         ModelAndView model
         ) throws IllegalStateException, IOException, SQLException {
      
      int res = editService.commentEdit(comment);
      model.addObject("result", res);
      model.setViewName("jsonView");
   return model;
   }
   

}
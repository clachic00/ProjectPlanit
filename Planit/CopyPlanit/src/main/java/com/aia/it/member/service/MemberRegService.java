package com.aia.it.member.service;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aia.it.member.dao.MemberDaoInterface;
import com.aia.it.member.model.Member;
import com.aia.it.member.model.MemberRegRequest;

@Service
public class MemberRegService {

	private MemberDaoInterface dao;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int regMember(MemberRegRequest regRequest, HttpServletRequest request ) {
		
		dao=sqlSessionTemplate.getMapper(MemberDaoInterface.class);
		
		int result=0;
		Member member = regRequest.toMember();
		
		try {
			
		
		MultipartFile file = regRequest.getPhoto();
		
		if(file != null && !file.isEmpty() && file.getSize()>0) {
			
			String uri= request.getSession().getServletContext().getInitParameter("memberUploadPath");
			String realPath = request.getSession().getServletContext().getRealPath(uri);
			String newFileName = System.nanoTime()+"_"+file.getOriginalFilename();

			File saveFile = new File(realPath, newFileName);
			file.transferTo(saveFile);
			
			
		}else {
			member.setUphoto("default.png");
		}

		result = dao.insertMember(member);
		
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
}

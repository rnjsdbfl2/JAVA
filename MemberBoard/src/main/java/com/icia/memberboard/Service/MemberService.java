package com.icia.memberboard.Service;

import java.io.File;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.DAO.MemberDAO;
import com.icia.memberboard.DTO.MemberDTO;


@Service
public class MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	
	public ModelAndView memberjoin(MemberDTO member) throws IllegalStateException, IOException {		
		mav = new ModelAndView();
		System.out.println(member.toString());
		MultipartFile mfile = member.getMfile();
		String mprofile = mfile.getOriginalFilename();
				
		String savePath = "D:\\Source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\img\\"+mprofile;
		
		if(!mfile.isEmpty()) {
			mfile.transferTo(new File(savePath));
		}
		member.setMprofile(mprofile);
		System.out.println(member.toString());
		int mjoinResult = mDAO.memberjoin(member);		
		if(mjoinResult > 0) {
			mav.setViewName("memberv/MemberLogin");
		} else {
			mav.setViewName("Home");
		}
		return mav;
	}


	public String idCheck(String mid) {
		String checkResult = mDAO.idCheck(mid);
		String resultMsg = null;
		
		if(checkResult == null)
			resultMsg = "OK";
		else
			resultMsg = "NO";
				
		return resultMsg;
	}


	public ModelAndView memberlogin(MemberDTO member) {
		mav = new ModelAndView();
		
		String loginID = mDAO.memberlogin(member);
		if(loginID != null) {
			session.setAttribute("loginID", loginID);
			mav.setViewName("redirect:/boardlist");
		} else 
		mav.setViewName("etcv/MemberLoginFail");{}
		return mav;
	}


	public ModelAndView memberlist() {
		mav = new ModelAndView();
		List<MemberDTO> memberList = mDAO.memberlist();
		mav.addObject("memberList", memberList);
		mav.setViewName("memberv/MemberList");
		return mav;
	}


	public MemberDTO memberview(String mid) {
		MemberDTO memberView = mDAO.memberview(mid);
		return memberView;
	}


	public ModelAndView memberdelete(String mid) {
		mav = new ModelAndView();
		int deleteResult = mDAO.memberdelete(mid);
		if(deleteResult > 0) 
			mav.setViewName("redirect:/memberlist");
		else
			mav.setViewName("MemberDeleteFail");
		return mav;
	}


	public ModelAndView memberupdate() {
		mav = new ModelAndView();
		String mid = (String)session.getAttribute("loginID");
		MemberDTO memberUpdate = mDAO.memberview(mid);
		mav.addObject("memberUpdate", memberUpdate);
		mav.setViewName("memberv/MemberUpdate");
		return mav;
	}


	public ModelAndView membermodify(MemberDTO member) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		
		MultipartFile mfile = member.getMfile();
		String mprofile = mfile.getOriginalFilename();
		
		String savePath = "D:\\Source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\img\\"+mprofile;
		
		if(!mfile.isEmpty()) {
			mfile.transferTo(new File(savePath));
		}
		member.setMprofile(mprofile);
		
		int modifyResult = mDAO.membermodify(member);
		if(modifyResult > 0)
			mav.setViewName("MemberMain");
		else
			mav.setViewName("MemberUpdateFail");
			
		return mav;
	}
	

		
}

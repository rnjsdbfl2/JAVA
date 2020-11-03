package com.icia.memberboard.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.DAO.BoardDAO;
import com.icia.memberboard.DTO.BoardDTO;
import com.icia.memberboard.DTO.MemberDTO;
import com.icia.memberboard.Service.MemberService;
import org.jsoup.*;

@Controller
public class MemberController {
	
	private ModelAndView mav;
		
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HttpSession session;
			
	@Autowired
	private BoardDAO bDAO;
	
	// Home 연결
	@RequestMapping(value="/")
	public String home() {
		return "Home";
	}
	// Home으로 
	@RequestMapping(value="goMain")
	public String goMain() {
		return "MemberMain";
	}
	
	// home에서 회원가입page로 이동
	@RequestMapping(value="/memberjoinform")
	public String joingform() {
		return "memberv/MemberJoin";
	}
	// home에서 로그인page로 이동	
	@RequestMapping(value="/memberloginform")
	public String loginfrom() {
		return "memberv/MemberLogin";
	}
	// home에서 crawling페이지로 이동
	@RequestMapping(value="/goParser")
	public String gocrawling() {
		return "Parser";		
	}
	// column추가
	@RequestMapping(value="addcolumn")
	public void addcolumn() {
	}
	
	
	// ID링크 누르면 MyPage로 이동하며 내가 쓴 글 목록 출력
	@RequestMapping(value="/gomypage")
	public ModelAndView gomypage() {
		mav = new ModelAndView();
		String bwriter = (String)session.getAttribute("loginID");
		List<BoardDTO> myList = bDAO.mylist(bwriter);
		mav.addObject("myList", myList);
		mav.setViewName("MyPage");
		return mav;
	}
	// 회원가입하기
	@RequestMapping(value="/memberjoin")
	public ModelAndView memberjoin(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		mav = mService.memberjoin(member);
		return mav;
	}
	// ID중복확인
	@RequestMapping(value="/idCheck")
	public @ResponseBody String idCheck(@RequestParam("mid") String mid) {
		String resultMsg = mService.idCheck(mid);
		return resultMsg;
	}
	// 회원로그인
	@RequestMapping(value="memberlogin")
	public ModelAndView memberlogin(@ModelAttribute MemberDTO member) {
		mav=mService.memberlogin(member);
		return mav;
	}
	// 회원목록
	@RequestMapping(value="memberlist")
	public ModelAndView memberlist() {
		mav = mService.memberlist();
		return mav;
	}
	// 회원상세조회
	@RequestMapping(value="/memberview")
	public @ResponseBody MemberDTO memberview(@RequestParam("mid") String mid) {
		MemberDTO memberView = mService.memberview(mid);
		return memberView;
	}
	//회원 삭제
	@RequestMapping(value="memberdelete")
	public ModelAndView memberdelete(@RequestParam("mid") String mid) {
		mav = mService.memberdelete(mid);
		return mav;
	}
	//회원 정보수정
	@RequestMapping(value="memberupdate")
	public ModelAndView memberupdate() {
		mav = mService.memberupdate();
		return mav;
	}
	@RequestMapping(value="membermodify")
	public ModelAndView membermodify(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		mav = mService.membermodify(member);
		return mav;
	}
	//회원 로그아웃
	@RequestMapping(value="memberlogout")
	public String memberlogout() {
		session.invalidate();
		return "Home";
	}
	
	
}//클래스 끝

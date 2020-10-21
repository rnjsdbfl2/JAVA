package com.icia.memberboard.Controller;

import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.DTO.BoardDTO;
import com.icia.memberboard.DTO.CommentDTO;
import com.icia.memberboard.Service.BoardService;
import com.icia.memberboard.Service.CommentService;


@Controller
public class BoardController {
	
	private ModelAndView mav;
	
	@Autowired
	private BoardService bService;
		
	// 글쓰기 화면전환
	@RequestMapping(value="boardwriteform")
	public String boardwriteform() {
		return "boardv/BoardWrite";
	}
	//글쓰기
	@RequestMapping(value="boardwrite")
	public ModelAndView boardwrite(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		mav = bService.boardwrite(board);
		return mav;
	}
	//글 목록
	@RequestMapping(value="boardlist")
	public ModelAndView boardlist() {
		mav = bService.boardlist();
		return mav;
	}
	
	//글 상세 보기
	@RequestMapping(value="boardview")
	public ModelAndView boardview(@RequestParam int bnumber, @ModelAttribute CommentDTO comment) {
		mav = bService.boardview(comment ,bnumber);
		
		return mav;
	}
	//글 수정 하기
	@RequestMapping(value="/boardupdate")
	public ModelAndView boardupdate(@RequestParam("bnumber") int bnumber) {
		mav = bService.boardupdate(bnumber);
		return mav;
	}
	@RequestMapping(value="/boardmodify")
	public ModelAndView boardmodify(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		mav = bService.boardmodify(board);
		return mav;
	}
	
	@RequestMapping(value="/boarddelete")
	public ModelAndView boarddelete(@ModelAttribute BoardDTO board) {
		mav = bService.boarddelete(board);
		return mav;
	}
	
	@RequestMapping(value="/boardsearch")
	public ModelAndView boardsearch(@RequestParam("searchtype") String searchtype,
			@RequestParam("keyword") String keyword) {
		mav = bService.boardsearch(searchtype, keyword);
		return mav;
	}
	
	@RequestMapping(value="/boardlistpaging")
	public ModelAndView boardlistpaging(
			@RequestParam(value="page",required=false,defaultValue="1") int page) {
		mav = bService.boardlistpaging(page);
		return mav;
	}
	
	
}// 컨트롤러 끝

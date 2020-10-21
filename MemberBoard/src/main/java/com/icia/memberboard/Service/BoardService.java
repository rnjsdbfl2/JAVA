package com.icia.memberboard.Service;

import java.io.File;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.memberboard.DAO.BoardDAO;
import com.icia.memberboard.DAO.CommentDAO;
import com.icia.memberboard.DTO.BoardDTO;
import com.icia.memberboard.DTO.CommentDTO;
import com.icia.memberboard.DTO.PageDTO;


@Service
public class BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CommentDAO cDAO;
		
	private ModelAndView mav;
	
	private static final int PAGE_LIMIT = 3;
	private static final int BLOCK_LIMIT = 5;
	
	public ModelAndView boardwrite(BoardDTO board) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile bfile = board.getBfile();
		String bfilename = bfile.getOriginalFilename();
		
		String savePath = "D:\\Source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\img\\"+bfilename;
		
		if(!bfile.isEmpty()) {
			bfile.transferTo(new File(savePath));
		}
		board.setBfilename(bfilename);
		int writeResult = bDAO.boardwrite(board);
		if(writeResult > 0)
			mav.setViewName("redirect:/boardlist");
		else
			mav.setViewName("etcv/BoardWriteFail");
		
		return mav;
	}

	public ModelAndView boardlist() {
		mav = new ModelAndView();		
		
		List<BoardDTO> boardList = bDAO.boardlist();
		mav.addObject("boardList", boardList);
		mav.setViewName("MemberMain");
		return mav;
	}
	
	public ModelAndView boardview(CommentDTO comment, int bnumber) {
		mav = new ModelAndView();
		bDAO.boardhits(bnumber);
		BoardDTO boardView = bDAO.boardview(bnumber);
		List<CommentDTO> commentList = cDAO.commentlist2(comment);		
		mav.addObject("boardView", boardView);
		mav.addObject("commentList", commentList);
		mav.setViewName("boardv/BoardView");
		return mav;
	}

	public ModelAndView boardupdate(int bnumber) {
		mav = new ModelAndView();
		BoardDTO boardUpdate = bDAO.boardview(bnumber);
		mav.addObject("boardView", boardUpdate);
		mav.setViewName("boardv/BoardUpdate");
		return mav;
	}

	public ModelAndView boardmodify(@ModelAttribute BoardDTO board) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		
		MultipartFile bfile = board.getBfile();
		String bfilename = bfile.getOriginalFilename();
				
		String savePath = "D:\\Source\\spring\\MemberBoard\\src\\main\\webapp\\resources\\img\\"+bfilename;
		
		if(!bfile.isEmpty()) {
			bfile.transferTo(new File(savePath));
		}
		board.setBfilename(bfilename);
		
		int modifyResult = bDAO.boardmodify(board);
		if(modifyResult > 0)
			mav.setViewName("redirect:/boardlist?bwriter"+board.getBwriter());
		else 
			mav.setViewName("boardv/BoardUpdateFail");
		return mav;
	}

	public ModelAndView boarddelete(BoardDTO board) {
		mav = new ModelAndView();
		int deleteResult = bDAO.boarddelete(board);
		if(deleteResult > 0)
			mav.setViewName("redirect:/boardlist?bwriter\"+board.getBwriter()");
		else 
			mav.setViewName("etcv/BoardDeleteFail");
		return mav;
	}

	public ModelAndView boardsearch(String searchtype, String keyword) {
		mav = new ModelAndView();
		List<BoardDTO> searchList = bDAO.boardsearch(searchtype, keyword);
		mav.addObject("boardList", searchList);
		mav.setViewName("MemberMain");
		return mav;
	}

	public ModelAndView boardlistpaging(int page) {
		mav = new ModelAndView();
		int listCount = bDAO.listCount();
		int startRow = (page-1)*PAGE_LIMIT + 1;
		int endRow = page*PAGE_LIMIT;
		
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		List<BoardDTO> boardList = bDAO.boardlistpaging(paging);
		// 한페이지에 글3개, 전체글 13개 -> 필요한페이지 몇개?
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage>maxPage) { 
			endPage = maxPage; 
		}
		
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);

		mav.addObject("paging", paging);
		mav.addObject("boardList", boardList);
		mav.setViewName("boardv/BoardListPaging");
		
		return mav;
	}
}

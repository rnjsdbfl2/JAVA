package com.icia.memberboard.Controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.memberboard.DTO.CommentDTO;
import com.icia.memberboard.Service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService cService;
	
	@RequestMapping(value="commentwrite")
	public @ResponseBody List<CommentDTO> commentwrite(@ModelAttribute CommentDTO comment) {
		System.out.println(comment+"111111111");
		List<CommentDTO> commentList = cService.commentwrite(comment);
		return commentList;
	}
}

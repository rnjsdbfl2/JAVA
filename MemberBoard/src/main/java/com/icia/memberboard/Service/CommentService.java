package com.icia.memberboard.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.memberboard.DAO.CommentDAO;
import com.icia.memberboard.DTO.CommentDTO;

@Service
public class CommentService {

	@Autowired
	private CommentDAO cDAO;
	
	public List<CommentDTO> commentwrite(CommentDTO comment) {
		int writeResult = cDAO.commentwrite(comment);
		System.out.println(comment+"22222222");
		List<CommentDTO> commentList = new ArrayList<CommentDTO>();
		if(writeResult > 0)
			commentList = cDAO.commentlist(comment);
		else
			commentList = null;
		
		return commentList;
	}

}

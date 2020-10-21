package com.icia.memberboard.DAO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.DTO.CommentDTO;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int commentwrite(CommentDTO comment) {
		return sql.insert("Comment.commentwrite", comment);
	}

	public List<CommentDTO> commentlist(CommentDTO comment) {
		return sql.selectList("Comment.commentlist", comment);
	}

	public List<CommentDTO> commentlist2(CommentDTO comment) {
		return sql.selectList("Comment.commentlist2", comment);	
	}
	
	
	
	
}

package com.icia.memberboard.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.DTO.BoardDTO;
import com.icia.memberboard.DTO.PageDTO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int boardwrite(BoardDTO board) {
		return sql.insert("Board.boardwrite", board);
	}

	public List<BoardDTO> boardlist() {
		return sql.selectList("Board.boardlist");
	}

	public BoardDTO boardview(int bnumber) {
		return sql.selectOne("Board.boardview", bnumber);
	}

	public void boardhits(int bnumber) {
		sql.update("Board.boardhits", bnumber);
	}

	public int boardmodify(BoardDTO board) {
		return sql.update("Board.boardmodify", board);
	}

	public int boarddelete(BoardDTO board) {
		return sql.delete("Board.boarddelete", board);
	}

	public List<BoardDTO> mylist(String bwriter) {
		return sql.selectList("Board.mylist", bwriter);
	}

	public List<BoardDTO> boardsearch(String searchtype, String keyword) {
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("type", searchtype);
		searchMap.put("word", keyword);
		return sql.selectList("Board.boardsearch", searchMap);
	}

	public int listCount() {
		return sql.selectOne("Board.boardlistcount");	
	}

	public List<BoardDTO> boardlistpaging(PageDTO paging) {
		return sql.selectList("Board.boardlistpaging", paging);
	}
	
	
	
	
	
	
}
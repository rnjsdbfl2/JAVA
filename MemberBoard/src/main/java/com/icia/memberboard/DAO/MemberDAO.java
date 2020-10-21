package com.icia.memberboard.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.memberboard.DTO.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int memberjoin(MemberDTO member) {
		if(member.getKakaoid() != null)
			return sql.insert("Member.kakaomemberjoin", member);
		else if(member.getNaverid() != null)
			return sql.insert("Member.navermemberjoin", member);
		else
			return sql.insert("Member.memberjoin", member);	}

	public String idCheck(String mid) {		
		return sql.selectOne("Member.idCheck", mid);
	}

	public String memberlogin(MemberDTO member) {
		return sql.selectOne("Member.memberlogin", member);
	}

	public List<MemberDTO> memberlist() {
		return sql.selectList("Member.memberlist");
	}

	public MemberDTO memberview(String mid) {
		return sql.selectOne("Member.memberview", mid);
	}

	public int memberdelete(String mid) {
		return sql.delete("Member.memberdelete", mid);
	}

	public int membermodify(MemberDTO member) {
		return sql.update("Member.membermodify", member);
	}

	
	
}

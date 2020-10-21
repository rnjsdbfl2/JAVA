package com.icia.memberboard.DTO;

import org.springframework.web.multipart.MultipartFile;


import lombok.*;


@Getter
@Setter
@ToString
public class MemberDTO {

	private String mid;
	private String mps;
	private String mname;
	private String mbirth;
	private String memail;
	private String maddress;
	private String mphone;
	private MultipartFile mfile;
	private String mprofile;
	
	private String kakaoid;
	private String naverid;
}

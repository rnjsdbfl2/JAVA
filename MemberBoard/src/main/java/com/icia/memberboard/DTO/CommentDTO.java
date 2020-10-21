package com.icia.memberboard.DTO;

import lombok.*;

@Getter
@Setter
@ToString
public class CommentDTO {
	
	private int cnumber;
	private int cbnumber;
	private String cwriter;
	private String ccontents;
}

package com.movie.watch.vo;

import lombok.Data;

@Data
public class FileUploadVO {
	
	private String uuid;
	private String uploadPath;
	private String fileNmae;
	private String fileType;
	
	
	private int bno;

}

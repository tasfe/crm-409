package com.kaishengit.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.User;

@Controller
public class HeadAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private String fileName;
	private long fileSize;
	private String mime;
	private int id;
	@Action(value="head",results={
			@Result(name="success",type="stream",params={
					"contentType","${mime}",
					"contentLength","${fileSize}",
					"inputName","documentStream",
					"contentDisposition","attachment;filename='${fileName}'",
					"bufferSize","1024"
			})
	})
	public String getHead() {
		return SUCCESS;
	}
	//该名称与action中的input名称相同
		public InputStream getDocumentStream() throws Exception{
			User user = getUserService().findById(id);
			String head = user.getHead();
			File file = new File("c://head//" + head);
			setFileName(file.getName());
			setFileSize(file.length());
			setMime("img/jpg");
			
			InputStream is = new FileInputStream(file); 
			return is;
		}

		//get set
		public String getFileName() {
			return fileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		public long getFileSize() {
			return fileSize;
		}

		public void setFileSize(long fileSize) {
			this.fileSize = fileSize;
		}

		public String getMime() {
			return mime;
		}

		public void setMime(String mime) {
			this.mime = mime;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		
	
}

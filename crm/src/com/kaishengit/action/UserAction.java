package com.kaishengit.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.stereotype.Controller;

import com.kaishengit.core.BaseAction;
import com.kaishengit.pojo.Product;
import com.kaishengit.pojo.User;
import com.kaishengit.util.MD5Util;
import com.kaishengit.util.UUIDUTil;
/**
 * 登录判断
 * @author lulu
 *
 */
@Controller
@Results({
	@Result(name="tologin",type="dispatcher",location="tologin.jsp")
})
public class UserAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private User user;
	private Product product;
	private File headfile;
	private String headfileFileName;
	private String headfileContentType;
	
	public static List<String> fileTypeList = new ArrayList<String>();
	static{
		fileTypeList.add("image/png");
		fileTypeList.add("image/gif");
		fileTypeList.add("image/jpg");
		fileTypeList.add("image/jpeg");
		fileTypeList.add("image/bmp");
	}
	
	
	@Action("tologin")
	public String execute() throws Exception {
		return super.execute();
	}
	
	//登录
	@Action(value="login",results={
		@Result(name="error",type="redirectAction",params={"actionName","tologin","code","10000"}),
		@Result(name="success",type="redirectAction",location="main.action")
	})
	public String login(){
		user = getUserService().findByNameAndPassword(user.getUsername(),user.getPassword());
		if(user != null) {
			//登陆成功,把user对象存入session中
			putSession("user", user);
			return "success";
		} else {
			return "error";
		}
	}
	
	
	//注册
	@Action(value="regist",results={
			@Result(name="success",type="redirectAction",location="main.action"),
			@Result(name="error",type="redirectAction",params={"actionName","tologin","state","10001"})
	})
	public String regist(){
		boolean result = getUserService().findByName(user.getUsername());
		if(result) {
			//用户已存在
			return ERROR;
		} else {
			//user为空,可以注册
			int id = getUserService().save(user,product);
			user.setId(id);
			putSession("user",user);
			return SUCCESS;
		}
	}
	
	@Action("loginout")
	public String loginout() {
		HttpSession session = ServletActionContext.getRequest().getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		return "tologin";
	}
	//user编辑页面
	@Action("useredit")
	public String edit() {
		return SUCCESS;
	}
	//修改
	@Action(value="modify",results={
			@Result(name="error",type="redirectAction",location="useredit.action?code=10001"),
			@Result(name="input",type="redirectAction",location="useredit.action?code=10002"),
			@Result(name="success",type="redirectAction",location="useredit.action?code=10000")
	})
	public String modify() {
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		String headname = UUIDUTil.getUUID();
		String extName = null;
		if(!fileTypeList.contains(headfileContentType)) {
			return ERROR;
		} else {
			try {
				extName = headfileFileName.substring(headfileFileName.lastIndexOf("."));
				bis = new BufferedInputStream(new FileInputStream(headfile));
				bos = new BufferedOutputStream(new FileOutputStream(new File("c://head//" + headname + extName)));
				
				byte[] buffer = new byte[1024];
				
				int len = -1;
				while((len = bis.read(buffer)) != -1){
						bos.write(buffer, 0, len);
				}
				
				if(bos != null){
					bos.flush();
					bos.close();
				}
				if(bis != null) {
					bis.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(user.getPassword() == null || "".equals(user.getPassword())) {
			user.setPassword(MD5Util.getMD5(((User)getSession("user")).getPassword()));
		} else {
			user.setPassword(MD5Util.getMD5(user.getPassword()));
		}
		user.setHead(headname + extName);
		getUserService().saveOrUpdate(user);
		putSession("user", user);
		return SUCCESS;
	}
	
	//get set
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public File getHeadfile() {
		return headfile;
	}

	public void setHeadfile(File headfile) {
		this.headfile = headfile;
	}

	public String getHeadfileFileName() {
		return headfileFileName;
	}

	public void setHeadfileFileName(String headfileFileName) {
		this.headfileFileName = headfileFileName;
	}

	public String getHeadfileContentType() {
		return headfileContentType;
	}

	public void setHeadfileContentType(String headfileContentType) {
		this.headfileContentType = headfileContentType;
	}
	
}
